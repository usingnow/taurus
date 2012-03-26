#encoding:UTF-8
class Order::BackOrdersController < ApplicationController
  before_filter :authenticate_administrator!

  def index

  end

  def new
    authorize! :create, Order
    @user = User.new
    @date = Time.now.strftime("%Y-%m-%d")
  end

  #内部 新建订单 用户搜索
  def user
    authorize! :create, Order
    @user = User.find_by_login_no(params[:user][:index])
    if @user.nil?
      user = CompanyExtend.find_by_company_no(params[:user][:index])
      if user.nil?
        user = PersonExtend.find_by_person_no(params[:user][:index])
      end
      if user.nil?
        @user = User.new
        @user.errors.add(:index, "不存在")
      else
        @user = User.find(user.user_id)
      end

    end
    @date = Time.now.strftime("%Y-%m-%d")
  end


  def create
    authorize! :create, Order
    #获得选择的商品
    back_order_skus = BackOrderSku.find_all_by_user_id(params[:user_id])

    #获得 此流程 的首站
    inner_order_payment = InnerOrderPayment.find_by_user_id(params[:user_id])
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(inner_order_payment.procedure_id,1)


    #判断 订单是否保留
    retention_flag = 0
    reserve_reason = nil
    back_order_skus.each do |cart|
      if cart.sku.sku_type == 2
        retention_flag = 1
        reserve_reason = "非在库品"
        break
      end
    end

    if retention_flag == 0
      back_order_skus.each do |cart|
        if cart.sku.nb_is_inventory == false
          retention_flag = 2
          reserve_reason = "[#{cart.sku.name}库存不足]"
          break
        end
      end
    end

    if retention_flag != 0
       condition = Condition.find_by_action("true")
       #获得保留单的下一站
       station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(inner_order_payment.procedure_id,station_procedureship.next_station_id,condition.id)
    else
      #获得 此流程 首战 的下一站 的下一站
      condition = Condition.find_by_action("false")
      station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(inner_order_payment.procedure_id,station_procedureship.next_station_id,condition.id)
    end


    Order.transaction do

      #获得收货地址
      inner_order_address = InnerOrderAddress.find_by_user_id(params[:user_id])

      #获得实例
      instance = current_instance(inner_order_payment.procedure_id,station.next_station_id)

      #保存过站记录
      hash = [{:instance_id => instance.id, :station_id => station_procedureship.station_id,
               :condition_id => Condition.find_by_action("true").id, :next_station_id => station_procedureship.next_station_id,
               :created_by => current_administrator.name},
              {:instance_id => instance.id, :station_id => station_procedureship.next_station_id,
               :condition_id => condition.id, :next_station_id => station.next_station_id,
               :created_by => current_administrator.name}]
      save_station_track(hash)



      @order = Order.new
      @order.number = current_order_number   #获得订单编号
      @order.batch = @order.number[0,8]+"-"+@order.number[9,13]
      @order.instance_id = instance.id
      @order.user_id = params[:user_id]
      @order.created_admin_id = current_administrator.id
      @order.updated_admin_id = current_administrator.id
      @order.district_no = inner_order_address.district_no
      @order.name = inner_order_address.name
      @order.address = inner_order_address.address
      @order.zip = inner_order_address.zip
      @order.phone = inner_order_address.phone
      @order.mobile = inner_order_address.mobile
      @order.email = inner_order_address.email
      @order.invoice_type = inner_order_payment.invoice_type
      @order.account_bank = inner_order_payment.account_bank
      @order.account_person_name = inner_order_payment.account_person_name
      @order.account_no = inner_order_payment.account_no
      @order.account_phone = inner_order_payment.account_phone
      @order.added_value_tax_no = inner_order_payment.added_value_tax_no
      @order.account_reg_add = inner_order_payment.account_reg_add
      @order.is_invoice_head = inner_order_payment.is_invoice_head
      @order.company_name = inner_order_payment.company_name
      @order.reserve_reason = reserve_reason
      if inner_order_address.district.city_no == 330200
        if back_order_skus.to_a.sum{ |sku| sku.subtotal } > 50
          @order.carriage_cost = 0
        else
          @order.carriage_cost = 5
        end
      else
        if back_order_skus.to_a.sum{ |sku| sku.subtotal } > 200
          @order.carriage_cost = 0
        else
          @order.carriage_cost = 20
        end
      end
      @order.carriage_adjustment = @order.carriage_cost

      @order.save
      create_order_details(back_order_skus,@order.id)

      BackOrderSku.delete_all(:user_id => params[:user_id])
    end

    redirect_to(admin_orders_url)
  end

  def internal_note
    @order = Order.find(params[:id])

    @order.update_attribute("inner_note",params[:order][:inner_note])

    redirect_to edit_admin_order_url(@order,:condition_id => session[:condition_id])
  end

  def carriage_adjustment
    authorize! :carriage_adjustment, Order
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])

    render "update_price"
  end

  def other_cost
    authorize! :other_cost, Order
    @order = Order.find(params[:id])
    @order.update_attributes(params[:order])

    render "update_price"
  end


  def create_user_address
    @order = Order.find(params[:id])
    user_addresses = @order.user.user_addresses.find_all_by_name_and_district_no_and_address(
      params[:order][:name],params[:order][:district_no],params[:order][:address])
    if user_addresses.any?
      render :json => "failure".to_json
    else
      @user_address =  @order.user.user_addresses.build params[:order]
      @user_address.save
      render "user_address_operating"
    end
  end

  def show_user_address
    @user_address = UserAddress.find(params[:id])
  end

end