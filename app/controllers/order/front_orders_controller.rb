#encoding:UTF-8
class Order::FrontOrdersController < ApplicationController
  layout "home"
  before_filter :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @cart = current_cart
    if @cart.total_items > 0
      user_id = current_user.id
      @cart_skuships = CartSkuship.where(:cart_id => @cart.id)
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

      @not_direct_sendings = CartSkuship.where("cart_id = #{@cart.id} and sku_id in(select id from skus where sku_type != 2)")
      @direct_sendings = CartSkuship.where("cart_id = #{@cart.id} and sku_id in(select id from skus where sku_type = 2)")


      @carriage_cost = 0
      @carriage_cost += @cart.nds_carriage_cost(@consignee_info.district.city_no) if @not_direct_sendings.any?
      @carriage_cost += @direct_sendings.to_a.sum{ |ds| ds.ds_carriage_cost(@consignee_info.district_no)} if @direct_sendings.any?


      @order_remark = params[:order_remark]
    else
      @cart = current_cart
      @procedures = Procedure.user_procedures @user.id
      @cart_skuships = CartSkuship.where(:cart_id => @cart.id)
      render :action => "new"
    end
  end

  def create
    user = current_user

    cart = Cart.find session[:cart_id]

    consignee_info = user.consignee_info
    temp_payment = InnerOrderPayment.find_by_user_id(user.id)
    #获得 此流程 的首站
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(temp_payment.procedure_id,1)

    session[:order_ids] = []
    Order.transaction do
      flag = false

      unless cart.not_direct_sends.empty?
        #判断 订单是否保留
        reserve_reason = cart.short_supply_skus(current_user.store_id)

        #获得判断订单保留站
        unless reserve_reason.blank?
           condition = Condition.find_by_action("true")
           station_procedureship_reserve = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(
               temp_payment.procedure_id,station_procedureship.next_station_id,condition.id)
        else
          condition = Condition.find_by_action("false")
          station_procedureship_reserve = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(
              temp_payment.procedure_id,station_procedureship.next_station_id,condition.id)
        end

        #获得实例
        instance = Instance.create(:procedure_id => temp_payment.procedure_id,
                                   :station_id => station_procedureship_reserve.next_station_id)


        #保存过站记录
        hash = [{:instance_id => instance.id, :station_id => station_procedureship.station_id,
                 :condition_id => Condition.find_by_action("true").id, :next_station_id => station_procedureship.next_station_id,
                 :created_by => "前台客户"},
                {:instance_id => instance.id, :station_id => station_procedureship.next_station_id,
                 :condition_id => condition.id, :next_station_id => station_procedureship_reserve.next_station_id,
                 :created_by => "前台客户"}]
        save_station_track(hash)

        order = Order.new(:number => current_order_number, :instance_id => instance.id, :user_id => user.id,
          :district_no => consignee_info.district_no, :name => consignee_info.name,:address => consignee_info.address,
          :zip => consignee_info.zip, :phone => consignee_info.phone, :mobile => consignee_info.mobile,
          :email => consignee_info.email, :invoice_type => temp_payment.invoice_type,
          :account_bank => temp_payment.account_bank, :account_person_name => temp_payment.account_person_name,
          :account_no => temp_payment.account_no, :account_phone => temp_payment.account_phone,
          :added_value_tax_no => temp_payment.added_value_tax_no, :account_reg_add => temp_payment.account_reg_add,
          :is_invoice_head => temp_payment.is_invoice_head, :company_name => temp_payment.company_name,
          :reserve_reason => reserve_reason, :customer_note => params[:customer_note],
          :carriage_cost => cart.nds_carriage_cost(consignee_info.district.city_no),
          :carriage_adjustment => cart.nds_carriage_cost(consignee_info.district.city_no))
        order.batch = order.number[0,8]+"-"+order.number[9,13]

        if order.save
          session[:order_ids] << order.id
          line_items = []

          cart.not_direct_sends.each do |nds|
            line_items << {:order_id => order.id, :sku_id => nds.sku_id, :unit_price => nds.sku.cost_aft_tax,
                           :quantity => nds.quantity}
          end

          if OrderDetail.create(line_items)
            flag = true
          end
        end

      end

      unless cart.direct_sends.empty?

        #获得判断订单保留站
        condition = Condition.find_by_action("true")
        station_procedureship_reserve = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(
             temp_payment.procedure_id,station_procedureship.next_station_id,condition.id)

        batch = nil
        cart.direct_sends.each do |ds|
          #获得实例
          instance = Instance.create(:procedure_id => temp_payment.procedure_id,
                                     :station_id => station_procedureship_reserve.next_station_id)


          #保存过站记录
          hash = [{:instance_id => instance.id, :station_id => station_procedureship.station_id,
                   :condition_id => Condition.find_by_action("true").id, :next_station_id => station_procedureship.next_station_id,
                   :created_by => "前台客户"},
                  {:instance_id => instance.id, :station_id => station_procedureship.next_station_id,
                   :condition_id => condition.id, :next_station_id => station_procedureship_reserve.next_station_id,
                   :created_by => "前台客户"}]
          save_station_track(hash)

          order = Order.new(:number => current_order_number, :instance_id => instance.id, :user_id => user.id,
            :district_no => consignee_info.district_no, :name => consignee_info.name,:address => consignee_info.address,
            :zip => consignee_info.zip, :phone => consignee_info.phone, :mobile => consignee_info.mobile,
            :email => consignee_info.email, :invoice_type => temp_payment.invoice_type,
            :account_bank => temp_payment.account_bank, :account_person_name => temp_payment.account_person_name,
            :account_no => temp_payment.account_no, :account_phone => temp_payment.account_phone,
            :added_value_tax_no => temp_payment.added_value_tax_no, :account_reg_add => temp_payment.account_reg_add,
            :is_invoice_head => temp_payment.is_invoice_head, :company_name => temp_payment.company_name,
            :reserve_reason => "直送品保留", :customer_note => params[:customer_note],
            :carriage_cost => ds.ds_carriage_cost(consignee_info.district_no),
            :carriage_adjustment => ds.ds_carriage_cost(consignee_info.district_no))
          if batch.nil?
            order.batch = order.number[0,8]+"-"+order.number[9,13]
            batch = order.batch
          else
            order.batch = batch
          end

          if order.save
            session[:order_ids] << order.id

            if OrderDetail.create(:order_id => order.id, :sku_id => ds.sku_id, :unit_price => ds.sku.cost_aft_tax,
                             :quantity => ds.quantity)
              flag = true
            else
              flag = false
            end
          end

        end

      end

      if flag
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to(success_order_front_orders_url)
      else
        redirect_to(home_url)
      end
    end
  end

  def success
    @orders = Order.where("id in(#{session[:order_ids].join(",")})")
  end


  def operate


  end

end
