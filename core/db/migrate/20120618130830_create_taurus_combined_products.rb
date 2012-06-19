class CreateTaurusCombinedProducts < ActiveRecord::Migration
  def change
    create_table :taurus_combined_products do |t|
    	t.integer :product_id
      t.integer :related_id

      t.timestamps
    end
    add_index :taurus_combined_products, :product_id
    add_index :taurus_combined_products, :related_id
  end

end
