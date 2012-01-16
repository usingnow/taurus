#encoding:UTF-8
class Admin::DeliveryOrdersController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @delivery_orders = DeliveryOrder.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @delivery_orders }
    end
  end

  # GET /delivery_orders/1
  # GET /delivery_orders/1.xml
  def show
    @delivery_order = DeliveryOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @delivery_order }
    end
  end

  # GET /delivery_orders/new
  # GET /delivery_orders/new.xml
  def new
    @delivery_order = DeliveryOrder.new
    admin_id = current_administrator.id
    order_id = params[:order_id]

    if order_id != nil
      order_details = OrderDetail.find_all_by_order_id(order_id)
      @delivery_order.order_id = order_id
      @delivery_order.store_id = order_details[0].order.store_id
      StoreEntryProductCart.destroy_all(:admin_id => admin_id, :cart_type => 2)
      line_items = []
      order_details.each do |detail|
        detail.sku.products.each do |product|
          line_items << {:product_id => product.id, :quantity => detail.quantity,
                      :admin_id => admin_id, :cart_type => 2}
        end
      end
      StoreEntryProductCart.create(line_items)
    end

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,2)

  end

  # GET /delivery_orders/1/edit
  def edit
    @delivery_order = DeliveryOrder.find(params[:id])
  end

  # POST /delivery_orders
  # POST /delivery_orders.xml
  def create
    admin_id = current_administrator.id

    #取出将要添加的商品
    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,2) #0：采购单，1：入库单 类型区分，

    if @store_entry_product_carts.empty?
      @delivery_order = DeliveryOrder.new
      @delivery_order.errors.add("商品","至少一件")
      render "new"
      return
    end

    DeliveryOrder.transaction do
      @delivery_order = DeliveryOrder.new(params[:delivery_order])
      @delivery_order.number = current_serial_number("DO")
      @delivery_order.administrator_id = admin_id

      if @delivery_order.save

        line_items = []

        @store_entry_product_carts.each do |cart|
          line_items << {:delivery_order_id => @delivery_order.id,
                         :product_id => cart.product_id,
                         :quantity => cart.quantity}
        end

        if ProdDelOrdship.create(line_items)
          if destroy_sepc_by_admin_id(admin_id,2) #删除出库单商品购物车
            subtract_store_quantity(@store_entry_product_carts,@delivery_order)
            @order = Order.find(@delivery_order.order_id)
            @order.update_attributes(:is_delivery => 0)
          end
        end

        redirect_to(admin_delivery_orders_url)
      else
        render :action => "new"
      end
    end
  end

  # PUT /delivery_orders/1
  # PUT /delivery_orders/1.xml
  def update
    @delivery_order = DeliveryOrder.find(params[:id])

    respond_to do |format|
      if @delivery_order.update_attributes(params[:delivery_order])
        format.html { redirect_to(@delivery_order, :notice => 'Delivery order was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @delivery_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_orders/1
  # DELETE /delivery_orders/1.xml
  def destroy
    @delivery_order = DeliveryOrder.find(params[:id])
    @delivery_order.destroy

    respond_to do |format|
      format.html { redirect_to(delivery_orders_url) }
      format.xml  { head :ok }
    end
  end

  def from_order
    @search = Order.search("is_delivery_eq" => "1")
    @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end
end
