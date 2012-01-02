class CreateStoreEntryProductCarts < ActiveRecord::Migration
  def self.up
    create_table :store_entry_product_carts do |t|
      t.integer :product_id
      t.integer :quantity, :default => 0
      t.date :delivery_date
      t.decimal :unit_price_aft_tax, :precision => 8, :scale => 2, :default => 0.00
      t.decimal :total_amount, :precision => 8, :scale => 2, :default => 0.00
      t.integer :admin_id

      t.timestamps
    end
  end

  def self.down
    drop_table :store_entry_product_carts
  end
end
