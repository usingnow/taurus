class CreateInnerSkuCarts < ActiveRecord::Migration
  def self.up
    create_table :inner_sku_carts do |t|
      t.integer :sku_id
      t.integer :quantity, :default => 1
      t.decimal :install_price, :default => 0.00
      t.decimal :assembling_price, :default => 0.00
      t.date :delivery_date
      t.decimal :total_amount, :default => 0.00
      t.integer :administrator_id

      t.timestamps
    end
  end

  def self.down
    drop_table :inner_sku_carts
  end
end
