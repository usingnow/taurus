class CreateTaurusDeliveryRecordProductLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_delivery_record_product_line_items do |t|
      t.integer :delivery_record_id, :null => false
      t.integer :product_id, :null => false
      t.integer :product_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_delivery_record_product_line_items, :delivery_record_id, :name => :del_rec_product_items_del_rec_id
    add_index :taurus_delivery_record_product_line_items, :product_id, :name => :del_rec_product_items_product_id
  end
end
