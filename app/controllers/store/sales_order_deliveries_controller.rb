#encoding:UTF-8
class Store::SalesOrderDeliveriesController < ApplicationController
  def index
    @search = Order.search("is_delivery_eq" => "1")
    @orders = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @delivery_order = DeliveryOrder.new
    admin_id = current_administrator.id
    order_id = params[:id]

    order_details = OrderDetail.find_all_by_order_id(order_id)
    @delivery_order.order_id = order_id
    @delivery_order.store_id = @delivery_order.order.user.store_id

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
    admin_id = current_administrator.id

    delivery_order_carts = DeliveryOrderCart.find_all_by_administrator_id(admin_id)

    if delivery_order_carts.empty?
      @delivery_order = DeliveryOrder.new
      @delivery_order.errors.add("商品","至少一件")
      render "show"
      return
    else
      delivery_order_carts.each do |cart|
        product_storeship = ProductStoreship.find_by_store_id_and_product_id(params[:delivery_order][:store_id],cart.product_id)
        if cart.quantity > product_storeship.quantity
          redirect_to store_sales_order_delivery_path(params[:delivery_order][:order_id]), :notice => "库存不足,无法出库."
          return
        end
      end
    end

    DeliveryOrder.transaction do
      @delivery_order = DeliveryOrder.new(params[:delivery_order])
      @delivery_order.number = current_serial_number("DO")
      @delivery_order.administrator_id = admin_id

      if @delivery_order.save

        line_items = []

        delivery_order_carts.each do |cart|
          line_items << {:delivery_order_id => @delivery_order.id,
                         :product_id => cart.product_id,
                         :quantity => cart.quantity}
        end

        if ProdDelOrdship.create(line_items)
          if DeliveryOrderCart.destroy_all(:administrator_id => admin_id)
            subtract_store_quantity(delivery_order_carts,@delivery_order)
            if !@delivery_order.order_id.nil?
              @order = Order.find(@delivery_order.order_id)
              @order.update_attribute("is_delivery",0)
            end
          end
        end
      end
    end

    redirect_to(store_delivery_orders_url)
  end
end