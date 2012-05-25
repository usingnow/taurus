class CreateTaurusReplenishmentRecordSkuLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_replenishment_record_sku_line_items do |t|
      t.integer :replenishment_record_id, :null => false
      t.integer :sku_id, :null => false
      t.integer :sku_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_replenishment_record_sku_line_items, :replenishment_record_id, :name => :rep_rec_sku_items_rep_rec_id
    add_index :taurus_replenishment_record_sku_line_items, :sku_id, :name => :rep_rec_sku_items_sku_id
  end
end
