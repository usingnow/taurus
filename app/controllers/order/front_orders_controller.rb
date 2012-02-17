#encoding:UTF-8
class Order::FrontOrdersController < ApplicationController
  layout "home"
  before_filter :authenticate_user!

  def index
    @cart = current_cart
    if @cart.total_items > 0
      user_id = current_user.id
      @cart_skuships = CartSkuship.where(:cart_id => @cart.id).paginate(:page => params[:page], :per_page => 10)
      @procedures = Procedure.user_procedures(user_id)
      @consignee_info = ConsigneeInfo.find_by_user_id(user_id)
      @user_addresses = UserAddress.find_all_by_user_id(user_id)
    else
      redirect_to cart_cart_skuships_url, :alert => "请添加商品！"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def review
    @user = current_user

    @temp_payment = InnerOrderPayment.new(params[:temp_payment])
    @temp_payment.user_id = @user.id

    unless [@temp_payment].map(&:valid?).include?(false)
      temp_payment = InnerOrderPayment.find_by_user_id(@user.id)
      if temp_payment.nil?
        @temp_payment.save
      else
        temp_payment.update_attributes(params[:temp_payment])
      end

      @cart = current_cart
      @temp_payment = InnerOrderPayment.find_by_user_id(@user.id)
      @consignee_info = ConsigneeInfo.find_by_user_id(@user.id)
      if @consignee_info.district.city_no == 330200
        if @cart.cart_skuships.to_a.sum{ |cart_sku| cart_sku.total_amount } > 50
          @carriage_cost = 0
        else
          @carriage_cost = 5
        end
      else
        if @cart.cart_skuships.to_a.sum{ |cart_sku| cart_sku.total_amount } > 200
          @carriage_cost = 0
        else
          @carriage_cost = 20
        end
      end
      @cart_skuships = CartSkuship.where("cart_id = #{@cart.id} and sku_id in(select id from skus where sku_type != 2)")
      @direct_sendings = CartSkuship.where("cart_id = #{@cart.id} and sku_id in(select id from skus where sku_type = 2)")
      @order_remark = params[:order_remark]
    else
      @cart = current_cart
      @procedures = Procedure.user_procedures @user.id
      @cart_skuships = CartSkuship.where(:cart_id => @cart.id).paginate(:page => params[:page], :per_page => 10)
      render :action => "index"
    end
  end

  def create
    #获得选择的商品
    cart_skuships = CartSkuship.find_all_by_cart_id(session[:cart_id])
    user_id = current_user.id
    #获得 此流程 的首站
    temp_payment = InnerOrderPayment.find_by_user_id(user_id)
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(temp_payment.procedure_id,1)


    #判断 订单是否保留
    retention_flag = 0
    reserve_reason = nil
    cart_skuships.each do |cart_sku|
      if cart_sku.sku.sku_type == 2
        retention_flag = 1
        reserve_reason = "非在库品"
        break
      end
    end

    if retention_flag == 0
      cart_skuships.each do |cart_sku|
        if cart_sku.sku.nb_is_inventory == false
          retention_flag = 2
          reserve_reason = "[#{cart_sku.sku.name}库存不足]"
          break
        end
      end
    end

    if retention_flag != 0
       condition = Condition.find_by_action("true")
       #获得保留单的下一站
       station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(temp_payment.procedure_id,station_procedureship.next_station_id,condition.id)
    else
      #获得 此流程 首战 的下一站 的下一站
      condition = Condition.find_by_action("false")
      station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(temp_payment.procedure_id,station_procedureship.next_station_id,condition.id)
    end


    Order.transaction do

      #获得收货地址
      temp_address = InnerOrderAddress.find_by_user_id(user_id)

      #获得实例
      instance = current_instance(temp_payment.procedure_id,station.next_station_id)

      #保存过站记录
      hash = [{:instance_id => instance.id, :station_id => station_procedureship.station_id,
               :condition_id => Condition.find_by_action("true").id, :next_station_id => station_procedureship.next_station_id,
               :created_by => "前台客户"},
              {:instance_id => instance.id, :station_id => station_procedureship.next_station_id,
               :condition_id => condition.id, :next_station_id => station.next_station_id,
               :created_by => "前台客户"}]
      save_station_track(hash)



      @order = Order.new
      @order.number = current_number   #获得订单编号
      @order.batch = @order.number[0,8]+"-"+@order.number[9,13]
      @order.instance_id = instance.id
      @order.user_id = user_id
      @order.district_no = temp_address.district_no
      @order.name = temp_address.name
      @order.address = temp_address.address
      @order.zip = temp_address.zip
      @order.phone = temp_address.phone
      @order.mobile = temp_address.mobile
      @order.email = temp_address.email
      @order.invoice_type = temp_payment.invoice_type
      @order.account_bank = temp_payment.account_bank
      @order.account_person_name = temp_payment.account_person_name
      @order.account_no = temp_payment.account_no
      @order.account_phone = temp_payment.account_phone
      @order.added_value_tax_no = temp_payment.added_value_tax_no
      @order.account_reg_add = temp_payment.account_reg_add
      @order.is_invoice_head = temp_payment.is_invoice_head
      @order.company_name = temp_payment.company_name
      @order.reserve_reason = reserve_reason
      @order.customer_note = params[:customer_note]
      if temp_address.district.city_no == 330200
        if cart_skuships.to_a.sum{ |cart_sku| cart_sku.total_amount } > 50
          @order.carriage_cost = 0
        else
          @order.carriage_cost = 5
        end
      else
        if cart_skuships.to_a.sum{ |cart_sku| cart_sku.total_amount } > 200
          @order.carriage_cost = 0
        else
          @order.carriage_cost = 20
        end
      end
      @order.carriage_adjustment = @order.carriage_cost

      if @order.save
        create_order_details(cart_skuships,@order.id)

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
      end
    end
    if @order
      redirect_to(order_front_order_url(@order))
    else
      redirect_to(home_url)
    end
  end

end
