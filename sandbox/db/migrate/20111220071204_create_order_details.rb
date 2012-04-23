class CreateOrderDetails < ActiveRecord::Migration
  def self.up
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :sku_id
      t.decimal :unit_price
      t.integer :quantity
      t.integer :is_need_install
      t.decimal :install_cost
      t.integer :is_need_assemble
      t.decimal :assemble_cost
      t.decimal :other_cost
      t.integer :created_admin_id
      t.integer :updated_admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :order_details
  end
end
