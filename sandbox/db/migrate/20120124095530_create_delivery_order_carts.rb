class CreateDeliveryOrderCarts < ActiveRecord::Migration
  def self.up
    create_table :delivery_order_carts do |t|
      t.integer :product_id
      t.integer :quantity, :default => 1
      t.integer :administrator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :delivery_order_carts
  end
end
