class AddNumberToDeliveryOrder < ActiveRecord::Migration
  def self.up
    add_column :delivery_orders, :number, :string
  end

  def self.down
    remove_column :delivery_orders, :number
  end
end
