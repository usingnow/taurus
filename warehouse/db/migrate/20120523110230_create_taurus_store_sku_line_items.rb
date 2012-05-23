class CreateTaurusStoreSkuLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_store_sku_line_items do |t|
      t.integer :store_id, :null => false
      t.integer :sku_id, :null => false
      t.integer :reserved, :default => 0
      t.integer :in_stock, :default => 0


      t.timestamps
    end
    add_index :taurus_store_sku_line_items, :store_id
    add_index :taurus_store_sku_line_items, :sku_id
  end
end
