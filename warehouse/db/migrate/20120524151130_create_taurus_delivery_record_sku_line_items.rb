class CreateTaurusDeliveryRecordSkuLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_delivery_record_sku_line_items do |t|
      t.integer :delivery_record_id, :null => false
      t.integer :sku_id, :null => false
      t.integer :sku_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_delivery_record_sku_line_items, :delivery_record_id, :name => :del_rec_sku_items_del_rec_id
    add_index :taurus_delivery_record_sku_line_items, :sku_id, :name => :del_rec_sku_items_sku_id
  end
end
