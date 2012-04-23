class CreatePoProductTempLists < ActiveRecord::Migration
  def change
    create_table :po_product_temp_lists do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :product_purchase_amount, :default => 1

      t.timestamps
    end
    add_index :po_product_temp_lists, :cart_id
    add_index :po_product_temp_lists, :product_id
  end
end
