class CreateCartSkuships < ActiveRecord::Migration
  def self.up
    create_table :cart_skuships do |t|
      t.integer :sku_id
      t.integer :cart_id
      t.integer :quantity, :default => 1
      t.integer :order_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cart_skuships
  end
end
