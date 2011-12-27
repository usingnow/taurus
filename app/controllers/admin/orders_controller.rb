#encoding:UTF-8
class Admin::OrdersController < ApplicationController
  # GET /orders
  # GET /orders.xml
  def index
    @orders = Order.find_by_sql("select *
                                 from   orders
                                 where  instance_id in(select id
                                                       from   instances
                                                       where  station_id in(select id
                                                                            from   stations
                                                                            where  station_type != 2
                                                                            and    station_type != 1))")
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
    @order = Order.new

    respond_to do |format|
      format.html { render :layout => "home"}
      format.xml  { render :xml => @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.xml
  def create
    @order = Order.new(params[:orders])
    @order.add_cart_skuships_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        format.html { redirect_to([:admin,@order], :notice => 'Order was successfully created.') }
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
        format.html { redirect_to(edit_admin_order_url(@order), :notice => 'Order was successfully updated.') }
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
    @instance = Instance.find(@order.instance_id)
    @station_procedureship = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,
                                                                                                       @instance.station_id,
                                                                                                       session[:condition_id])
    @instance.update_attributes(:station_id=>@station_procedureship.next_station_id)

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
end
