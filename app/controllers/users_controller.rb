#encoding:UTF-8
class UsersController < ApplicationController
  def index
    delivery_orders = DeliveryOrder.find_by_sql("select * from delivery_orders where order_id is not null and created_at < '2012-02-02 12:00:00' and created_at > '2012-01-18 00:00:00'")
    delivery_orders.each do |del|
      del.order.order_details.each do |detail|
        detail.sku.sku_productships.each do |ship|
          quantity = ship.package_num*detail.quantity-detail.quantity
          product_storeship = ProductStoreship.find_by_store_id_and_product_id(del.store_id,ship.product_id)
          product_storeship.update_attributes(:quantity => product_storeship.quantity-quantity)
        end
      end
    end
  end
end
