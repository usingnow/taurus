class CreateDeliveryOrders < ActiveRecord::Migration
  def self.up
    create_table :delivery_orders do |t|
      t.integer :order_id
      t.integer :store_id
      t.integer :administrator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :delivery_orders
  end
end
