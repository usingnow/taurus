#encoding:UTF-8
class Admin::OrdersController < ApplicationController
  before_filter :authenticate_administrator!
  # GET /orders
  # GET /orders.xml
  def index
    q = {"instance_station_station_type_in" => ['0','3','4']}.merge(params[:q] || {})
    @q = Order.search(q)
    @orders = @q.result(:distinct => true)

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
    if session[:step1].nil?
      @user = User.new
      session[:step1] = @user
    end


    respond_to do |format|
      format.html { render :layout => "home"}
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  # POST /orders
  # POST /orders.xml
  def create
     #获得此 流程的首站
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(params[:procedure][:procedure_id],1)

    @cart_skuships = CartSkuship.find_all_by_cart_id(session[:cart_id])

    condition = Condition.find_by_action("false")

    station_id = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(params[:procedure][:procedure_id],station_procedureship.next_station_id,condition.id)

    #判断 订单是否保留
    @cart_skuships.each do |cart_skuship|
      if cart_skuship.sku.sku_type == 2
        condition = Condition.find_by_action("true")
        station_id = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(params[:procedure][:procedure_id],station_procedureship.next_station_id,condition.id)
        break
      end
    end

    instance = Instance.new(:procedure_id=>params[:procedure][:procedure_id],:station_id=>station_id.next_station_id)
    instance.save

    @order = Order.new(params[:order])
    @order.instance_id = instance.id
    @order.number = current_number   #获得订单编号
    @order.batch = @order.number
    @order.user_id = session[:step1].id

    session[:step1] = nil

    total_price = 0
    @cart_skuships.each do |cart_skuship|
      total_price += cart_skuship.sku.cost_aft_tax*cart_skuship.quantity
    end
    @order.total_price = total_price

    respond_to do |format|
      if @order.save

        @cart_skuships.each do |cart_skuship|
           @order_detail = OrderDetail.new
           @order_detail.order_id = @order.id
           @order_detail.sku_id = cart_skuship.sku_id
           @order_detail.unit_price = cart_skuship.sku.cost_aft_tax
           @order_detail.quantity = cart_skuship.quantity
           @order_detail.save
        end

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil

        format.html { redirect_to(admin_orders_url, :notice => 'Order was successfully created.') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
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
    admin_id = params[:admin_id]


    @order = Order.find(params[:id])

    @order.update_attributes(:take_admin_id=>admin_id)

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

    if params[:order_pay] != nil
      @order_pay = OrderPay.new(params[:order_pay])
      @order_pay.order_id = @order.id
      @order_pay.save
    end


    @instance = Instance.find(@order.instance_id)
    @station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,
                                                                                                       @instance.station_id,
                                                                                                       session[:condition_id])
    @instance.update_attributes(:station_id=>@station_procedureship.next_station_id)

    @order.update_attributes(params[:order])


    session[:order_id] = nil
    session[:condition_id] = nil
    respond_to do |format|
      format.html { redirect_to(admin_orders_url) }
    end
  end

  def paid
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
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

  #内部 新建订单第一步
  def step1
    user_no = params[:user_no]
    login_no = params[:login_no]

    info = ''
    respond_to do |format|
      if !user_no.blank?
        person_extend = PersonExtend.find_by_person_no(user_no)
        company_extend = CompanyExtend.find_by_company_no(user_no)
        if !person_extend.nil?
          user_id = person_extend.user_id
        else
          user_id = company_extend.user_id
        end
        @user = User.find(user_id)
        session[:step1] = @user
      elsif !login_no.blank?
        @user = User.find_by_login_no(login_no)
        session[:step1] = @user
      else
        info = "会员编号或会员用户名为空"
      end

      format.html { redirect_to new_admin_order_url , :notice => info }
    end
  end

  def step2
    if session[:step1].id.nil?
      respond_to do |format|
        format.html { redirect_to new_admin_order_url , :notice => "会员编号或会员用户名为空" }
      end
      return
    end
    name = params[:name] ||= '!@#$%'
    @skus = Sku.all(:conditions => ['name LIKE ?', "%#{name}%"])

    @cart = Cart.new(:id=>0)
    if !params[:sku_id].nil?
      @cart = current_cart
      sku = Sku.find(params[:sku_id])
      @cart_skuship = @cart.add_sku(sku.id)
      @cart_skuship.save
    end

    @cart_skuships = CartSkuship.find_all_by_cart_id(@cart.id)
  end

  def step3
    @order = Order.new

  end

  def input_pay_info
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end
end
