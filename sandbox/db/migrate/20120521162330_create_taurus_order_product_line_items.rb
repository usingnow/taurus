class CreateTaurusOrderProductLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_order_product_line_items do |t|
      t.integer :order_id, :null => false
      t.integer :product_id, :null => false
      t.integer :product_amount, :default => 1
      t.decimal :unit_price, :precision => 8, :scale => 2, :default => 0

      t.timestamps
    end

    add_index :taurus_order_product_line_items, :order_id
    add_index :taurus_order_product_line_items, :product_id
  end

end
