class AddDeliveryTypeToDeliveryOrders < ActiveRecord::Migration
  def self.up
    add_column :delivery_orders, :delivery_type, :integer, :default => 0
    execute "update delivery_orders set delivery_type = 5"
  end

  def self.down
    remove_column :delivery_orders, :delivery_type
  end
end
