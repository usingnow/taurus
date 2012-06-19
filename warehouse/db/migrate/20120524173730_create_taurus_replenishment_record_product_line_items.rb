class CreateTaurusReplenishmentRecordProductLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_replenishment_record_product_line_items do |t|
      t.integer :replenishment_record_id, :null => false
      t.integer :product_id, :null => false
      t.integer :product_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_replenishment_record_product_line_items, :replenishment_record_id, :name => :rep_rec_product_items_rep_rec_id
    add_index :taurus_replenishment_record_product_line_items, :product_id, :name => :rep_rec_product_items_product_id
  end
end
