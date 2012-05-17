class CreateTaurusProductSkuLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_product_sku_line_items do |t|
      t.integer :product_id 
      t.integer :sku_id
      t.integer :sku_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_product_sku_line_items, :product_id
    add_index :taurus_product_sku_line_items, :sku_id
  end

end
