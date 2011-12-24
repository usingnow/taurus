#encoding:UTF-8
class OrdersController < ApplicationController
  layout "home"
  #结算页面
  def new
    respond_to do |format|
      if session[:user] != nil
        @cart_skuships = CartSkuship.find_all_by_cart_id(session[:cart_id])

        @order = Order.new
        format.html
        format.xml  { render :xml => @order }
      else
        format.html{ redirect_to(cart_skuships_url, :notice => '请登录') }
      end
    end
  end

  def create
    station_procedureship = StationProcedureship.find_by_procedure_id_and_sequence(params[:procedure][:procedure_id],1)
    instance = Instance.new(:procedure_id=>params[:procedure][:procedure_id],:station_id=>station_procedureship.station_id)
    instance.save

    @order = Order.new(params[:order])
    @order.instance_id = instance.id

    respond_to do |format|
      if @order.save
        @cart_skuships = CartSkuship.find_all_by_cart_id(session[:cart_id])
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
        format.html { redirect_to(home_url, :notice => '创建成功') }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end
end
