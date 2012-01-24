class AlterDeliveryOrders < ActiveRecord::Migration
  def self.up
    add_column :delivery_orders, :line_type, :integer
    add_column :delivery_orders, :name, :string
    add_column :delivery_orders, :phone, :string
    add_column :delivery_orders, :waybill_number, :string
    add_column :delivery_orders, :delivery_date, :datetime
  end

  def self.down
    remove_column :delivery_orders, :line_type, :name, :phone, :waybill_number, :delivery_date
  end
end
