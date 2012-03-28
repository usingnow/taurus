#encoding:UTF-8
class Store::DeliveryOrdersController < ApplicationController
  before_filter :authenticate_administrator!

  def index
    @search = DeliveryOrder.search(params[:q])
    @search.sorts = "created_at desc"
    @delivery_orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @delivery_order = DeliveryOrder.find(params[:id])
    render "order_show" if @delivery_order.delivery_type == 1
  end

  def new
    @delivery_order = DeliveryOrder.new

    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(current_administrator.id,2)
  end

  def edit
    @delivery_order = DeliveryOrder.find(params[:id])
  end


  def create
    admin_id = current_administrator.id

    #取出将要添加的商品
    @store_entry_product_carts = StoreEntryProductCart.find_all_by_admin_id_and_cart_type(admin_id,2) #0：采购单，1：入库单 类型区分，

    if @store_entry_product_carts.empty?
      @delivery_order = DeliveryOrder.new
      @delivery_order.errors.add("商品","至少一件")
      render "new"
      return
    else
      error = []
      @store_entry_product_carts.each do |cart|
        product_storeship = ProductStoreship.find_by_store_id_and_product_id(params[:delivery_order][:store_id],cart.product_id)
        if cart.quantity > product_storeship.quantity
          error << cart.product.product_id
        end
      end
      if !error.empty?
        redirect_to new_store_delivery_order_path, :notice => "#{error.to_s}库存不足,无法出库."
        return
      end
    end

    DeliveryOrder.transaction do
      @delivery_order = DeliveryOrder.new(params[:delivery_order])
      @delivery_order.number = current_serial_number("DO")
      @delivery_order.administrator_id = admin_id

      @store_entry_product_carts.each do |cart|
        @delivery_order.prod_del_ordships << ProdDelOrdship.new(:delivery_order_id => @delivery_order.id,
                       :product_id => cart.product_id,
                       :quantity => cart.quantity)
      end

      if @delivery_order.save
        if destroy_sepc_by_admin_id(admin_id,2) #删除出库单商品购物车
          subtract_store_quantity(@store_entry_product_carts,@delivery_order)
        end

        redirect_to(store_delivery_orders_url)
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

end
