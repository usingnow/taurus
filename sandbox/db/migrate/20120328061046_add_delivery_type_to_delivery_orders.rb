class AddDeliveryTypeToDeliveryOrders < ActiveRecord::Migration
  def self.up
    add_column :delivery_orders, :delivery_type, :integer, :default => 0
    execute "update delivery_orders set delivery_type = 1 where order_id is not null"
    execute "update delivery_orders set delivery_type = 6 where order_id is null"
  end

  def self.down
    remove_column :delivery_orders, :delivery_type
  end
end
