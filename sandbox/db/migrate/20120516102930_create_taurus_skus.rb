class CreateTaurusSkus < ActiveRecord::Migration
  def change
    create_table :taurus_skus do |t|
    	t.string :number
    	t.string :name
    	t.integer :product_category_id
    	t.integer :brand_id
    	t.integer :supplier_id
    	t.string :place_of_origin
    	t.string :unit
    	t.string :model
    	t.string :specifications
    	t.string :dimensions
    	t.decimal :cost_before_tax, :precision => 8, :scale => 2, :default => 0
    	t.decimal :cost_after_tax, :precision => 8, :scale => 2, :default => 0
    	t.decimal :weight, :precision => 10, :scale => 3, :default => 0
    	t.integer :delivery_days, :default => 0
    	t.string :delivery_notice
    	t.text :remarks

      t.timestamps
    end
    add_index :taurus_skus, :product_category_id
    add_index :taurus_skus, :brand_id
    add_index :taurus_skus, :supplier_id
  end

end
