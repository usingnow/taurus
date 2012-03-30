#encoding:UTF-8
class Store::SalesOrderDeliveriesController < ApplicationController
  def index
    authorize! :create, DeliveryOrder
    @search = Order.search("is_delivery_eq" => "1")
    @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end


  def show
    authorize! :create, DeliveryOrder
    @delivery_order = DeliveryOrder.find(params[:id])
  end

  def new
    authorize! :create, DeliveryOrder
    @delivery_order = DeliveryOrder.new
    admin_id = current_administrator.id
    order_id = params[:order_id]

    order_details = OrderDetail.find_all_by_order_id(order_id)
    @delivery_order.order_id = order_id

    DeliveryOrderCart.destroy_all(:administrator_id => admin_id)
    line_items = []
    order_details.each do |detail|
      detail.sku.sku_productships.each do |ship|
        line_items << { :product_id => ship.product_id, :quantity => detail.quantity*ship.package_num,
                    :administrator_id => admin_id }
      end
    end
    DeliveryOrderCart.create(line_items)

    @delivery_order_carts = DeliveryOrderCart.find_all_by_administrator_id(admin_id)
  end

  def create
    authorize! :create, DeliveryOrder
    admin_id = current_administrator.id

    delivery_order_carts = DeliveryOrderCart.find_all_by_administrator_id(admin_id)

    if delivery_order_carts.empty?
      @delivery_order = DeliveryOrder.new
      @delivery_order.errors.add("商品","至少一件")
      render "new"
      return
    else
      @delivery_order = DeliveryOrder.new(params[:delivery_order])
      @delivery_order.number = current_serial_number("DO")
      @delivery_order.administrator_id = admin_id
      @delivery_order.store_id = @delivery_order.order.user.store_id
      @delivery_order.delivery_type = 1

      error = []
      delivery_order_carts.each do |cart|
        if cart.quantity > cart.product.inventory(@delivery_order.store_id)
          error << cart.product.product_id
        end
      end
      if !error.empty?
        redirect_to new_store_sales_order_delivery_path(:order_id => params[:delivery_order][:order_id]), :notice => "#{error.to_s}库存不足,无法出库."
        return
      end
    end

    DeliveryOrder.transaction do
      delivery_order_carts.each do |cart|
        @delivery_order.prod_del_ordships << ProdDelOrdship.new(:delivery_order_id => @delivery_order.id,
                       :product_id => cart.product_id,
                       :quantity => cart.quantity)
      end

      if @delivery_order.save
        if DeliveryOrderCart.destroy_all(:administrator_id => admin_id)
          subtract_store_quantity(delivery_order_carts,@delivery_order)
          @delivery_order.order.update_attribute("is_delivery",0)
        end
      end
    end

    redirect_to(store_delivery_orders_url)
  end
end