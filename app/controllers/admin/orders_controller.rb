#encoding:UTF-8
class Admin::OrdersController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource
  # GET /orders
  # GET /orders.xml
  def index
    q = {"instance_station_station_type_in" => ['0','3','4']}.merge(params[:q] || {})
    @search = Order.search(q)
    sort = params[:sort] ||= "desc"

    @search.sorts = "created_at #{sort}"
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

    Order.transaction do
      if !@order.update_attributes(params[:order])
        render "cancel"
        return
      end

      if !params[:order].nil?
        if !params[:order][:store_id].nil?
          if !is_have_store(@order,params[:order][:store_id])
            @order.errors.add("选择的仓库","无此货物")
            render "output"
            return
          end
        end
      end


      #保存支付宝支付信息
      if !params[:order_pay].nil?
        hash = {"order_id" => @order.id, "alipay_price_confirmation" => @order.total_amount, "price_confirmation" => @order.total_amount}.merge(params[:order_pay] || {})
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

      #保存过站记录
      hash = [{:instance_id => @instance.id, :station_id => @instance.station_id,
               :condition_id => session[:condition_id], :next_station_id => @station_procedureship.next_station_id,
               :created_by => current_administrator.name}]
      save_station_track(hash)

      #执行业务函数
      if !@station_procedureship.business_function_id.nil?
        if @station_procedureship.business_function.function == "delivery"
          @order.update_attributes(:is_delivery => 1)
        end
      end

      station_id = @station_procedureship.next_station_id
      if @station_procedureship.next_station_id == 4
        retention_flag = 0
        reserve_reason = nil
        @order.order_details.each do |detail|
          if detail.sku.sku_type == 2
            retention_flag = 1
            reserve_reason = "非在库品"
            break
          end
        end

        if retention_flag == 0
          @order.order_details.each do |detail|
            if detail.sku.nb_is_inventory == false
              retention_flag = 2
              reserve_reason = "[#{detail.sku.name}库存不足]"
              break
            end
          end
        end


        if retention_flag != 0
          condition = Condition.find_by_action("true")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          #保存过站记录
          hash = [{:instance_id => @instance.id, :station_id => 4,
                 :condition_id => condition.id, :next_station_id => station.next_station_id,
                 :created_by => current_administrator.name}]
          save_station_track(hash)
          station_id = station.next_station_id
          @order.update_attributes(:reserve_reason => reserve_reason)
        else
          condition = Condition.find_by_action("false")
          #获得保留单的下一站
          station = StationProcedureship.find_by_procedure_id_and_station_id_and_condition_id(@instance.procedure_id,4,condition.id)
          station_id = station.next_station_id
        end
      end

      if @instance.update_attributes(:station_id=>station_id)
         session[:order_id] = nil
         session[:condition_id] = nil
         redirect_to(admin_orders_url)
      end
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





  #所有字段订单搜索
  def all
    @search = Order.search(params[:q])
    @search.sorts = 'created_at desc'
    @orders = @search.result.paginate(:page => params[:page],:per_page => 15)
  end


  def relieve_retention
    @order = Order.find(params[:id])
    session[:order_id] = @order.id
    session[:condition_id] = params[:condition_id]
  end

  #打印送货单
  def print_delivery_note
    @search = Order.search(params[:q])
    @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show_delivery_note
    @order = Order.find(params[:order_id])
    render :layout => false
  end
end
