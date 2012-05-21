class CreateTaurusCartProductLineItems < ActiveRecord::Migration
  def change
    create_table :taurus_cart_product_line_items do |t|
      t.integer :cart_id, :null => false
      t.integer :product_id, :null => false
      t.integer :product_amount, :default => 1

      t.timestamps
    end
    add_index :taurus_cart_product_line_items, :cart_id
    add_index :taurus_cart_product_line_items, :product_id
  end

end
