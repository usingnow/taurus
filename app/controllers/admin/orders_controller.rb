#encoding:UTF-8
class Admin::OrdersController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource
  # GET /orders
  # GET /orders.xml
  def index
    q = {"instance_station_station_type_in" => ['0','3','4']}.merge(params[:q] || {})
    @search = Order.search(q)
    @search.sorts = "created_at desc"
    @orders = @search.result.paginate(:page => params[:page],:per_page => 15)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.xml
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.xml
  def new
    @date = Time.now.strftime('%Y-%m-%d')
    @user = User.new
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @search = Sku.search(params[:q])
  end

  # POST /orders
  # POST /orders.xml
  def create
    #获得选择的商品
    inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])

    #获得 此流程 的首站
    inner_order_payment = InnerOrderPayment.find_by_user_id(session[:user_id])
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(inner_order_payment.procedure_id,1)

    #获得 此流程 首战 的下一站 的下一站
    condition = Condition.find_by_action("false")
    station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(inner_order_payment.procedure_id,station_procedureship.next_station_id,condition.id)

    #判断 订单是否保留
    inner_sku_carts.each do |cart|
      if cart.sku.sku_type == 2
        condition = Condition.find_by_action("true")
        #获得保留单的下一站
        station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(inner_order_payment.procedure_id,station_procedureship.next_station_id,condition.id)
        break
      end
    end


    #获得收货地址
    inner_order_address = InnerOrderAddress.find_by_user_id(session[:user_id])

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
    @order.number = current_number   #获得订单编号
    @order.batch = @order.number
    @order.instance_id = instance.id
    @order.user_id = session[:user_id]
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
    total_price = 0
    inner_sku_carts.each do |cart|
      total_price += cart.sku.cost_aft_tax*cart.quantity
    end
    @order.total_price = total_price

    if @order.save
      create_order_details(inner_sku_carts)

      InnerSkuCart.delete_all(:user_id => session[:user_id])

      redirect_to(admin_orders_url)
    else
      render :action => "new"
    end
  end

  # PUT /orders/1
  # PUT /orders/1.xml
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to(edit_admin_order_url(@order,:condition_id => session[:condition_id]), :notice => 'Order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.xml
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to(admin_orders_url) }
      format.xml  { head :ok }
    end
  end

  #订单接管与取消
  def take_over
    @order = Order.find(params[:id])
    admin = current_administrator

    if params[:type] == "0"
      @order.update_attributes(:take_admin_id=>nil)
    else
      @order.update_attributes(:take_admin_id=>admin.id)
    end


    hash = [{:order_id => params[:id], :oper_type => params[:type], :created_by => admin.name,
             :administrator_id => admin.id}]
    save_take_log(hash)


    respond_to do |format|
      format.html { redirect_to(admin_orders_url) }
      format.xml  { head :ok }
    end
  end

  def cancel
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def condition
    @order = Order.find(session[:order_id])

    if !@order.update_attributes(params[:order])
      render "cancel"
      return
    end

    if !params[:order].nil?
      if !params[:order][:store_id].nil?
        if !is_have_store(@order,params[:store])
          @order.errors.add("选择的仓库","无此货物")
          render "output"
          return
        end
      end
    end

    #保存支付宝支付信息
    if !params[:order_pay].nil?
      hash = {"order_id" => @order.id, "alipay_price_confirmation" => @order.total_amount}.merge(params[:order_pay] || {})
      @order_pay = save_order_pay(hash)
      if @order_pay.errors.size > 0
        if params[:order_pay][:condition_type] == "1"
          render "paid"
        elsif params[:order_pay][:condition_type] == "2"
          render "input_pay_info"
        end
        return
      end
    end

    @instance = Instance.find(@order.instance_id)
    @station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,
                                                                                                       @instance.station_id,
                                                                                                       session[:condition_id])

    #执行业务函数
    if !@station_procedureship.business_function_id.nil?
      if @station_procedureship.business_function.function == "delivery"
        @order.update_attributes(:is_delivery => 1)
      end
    end

    #保存过站记录
    hash = [{:instance_id => @instance.id, :station_id => @instance.station_id,
             :condition_id => session[:condition_id], :next_station_id => @station_procedureship.next_station_id,
             :created_by => current_administrator.name}]
    save_station_track(hash)

    if @instance.update_attributes(:station_id=>@station_procedureship.next_station_id)
       session[:order_id] = nil
       session[:condition_id] = nil
       redirect_to(admin_orders_url)
    end
  end

  def paid
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @order_pay = OrderPay.new
  end

  def output
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def sign_in
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  def input_pay_info
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
    @order_pay = OrderPay.new
  end

  def pay_confirmation
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  #内部 新建订单 用户搜索
  def user_sear
    session[:user_id] = nil
    type = params[:type]
    user_no = params[:user_no]
    login_no = params[:login_no]

    if type == "0"
      if user_no.slice(0,1) == "U"
        company_extend = CompanyExtend.find_by_company_no(user_no)
        @user = User.find(company_extend.user_id) unless company_extend.nil?
      elsif user_no.slice(0,1) == "P"
        person_extend = PersonExtend.find_by_person_no(user_no)
        @user = User.find(person_extend.user_id) unless person_extend.nil?
      end

      if @user.nil?
        @user = User.new
        @user.errors.add("会员编号", "不存在")
      else
        session[:user_id] = @user.id
      end
    else
      @user = User.find_by_login_no(login_no)
      if @user.nil?
        @user = User.new
        @user.errors.add("会员用户名", "不存在")
      else
        session[:user_id] = @user.id
      end

    end

    @date = Time.now.strftime("%Y-%m-%d")

    render "new"
  end

  def step2
    if session[:user_id].nil?
      @date = Time.now.strftime("%Y-%m-%d")
      @user = User.new
      @user.errors.add("会员", "不能为空")
      render "new"
    else
      @inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
      @search = Sku.search(params[:q])
      @inner_sku_cart = InnerSkuCart.new
    end
  end

  #内部 新建订单 第二部 搜索商品
  def sku_sear
    @search = Sku.search(params[:q])
    @search.sorts = 'updated_at desc'
    @skus = @search.result.paginate(:page => params[:page],:per_page => 20)
  end

  def step3
    inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
    if inner_sku_carts.empty?
      @inner_sku_cart = InnerSkuCart.new
      @inner_sku_cart.errors.add("商品","至少一件")
      @inner_sku_carts = inner_sku_carts
      @search = Sku.search(params[:q])
      render "step2"
      return
    end
    @procedures = Procedure.all
  end

  #所有字段订单搜索
  def all
    @search = Order.search(params[:q])
    @search.sorts = 'created_at desc'
    @orders = @search.result.paginate(:page => params[:page],:per_page => 15)
  end

  def step4
    @inner_order_payment = InnerOrderPayment.find_by_user_id(session[:user_id])
    if @inner_order_payment.nil?
      @inner_order_payment = InnerOrderPayment.new(params[:inner_order_payment])
      @inner_order_payment.user_id = session[:user_id]
      @inner_order_payment.save
    else
      @inner_order_payment.update_attributes(params[:inner_order_payment])
    end
  end

  def step5
    @inner_order_address = InnerOrderAddress.find_by_user_id(session[:user_id])
    if @inner_order_address.nil?
      @inner_order_address = InnerOrderAddress.new(params[:inner_order_address])
      @inner_order_address.user_id = session[:user_id]
      @inner_order_address.save
    else
      @inner_order_address.update_attributes(params[:inner_order_address])
    end

    @inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
  end

  def print
    @order = Order.find(params[:order_id])
    render :layout => false
  end
end
