class CreateTaurusProducts < ActiveRecord::Migration
  def change
    create_table :taurus_products do |t|
        t.string :number
        t.string :name
        t.integer :product_category_id
        t.string :place_of_origin
        t.string :unit
        t.string :manufacturer
        t.decimal :market_price, :precision => 8, :scale => 2, :default => 0
        t.decimal :tax, :precision => 10, :scale => 4
        t.decimal :price_after_tax, :precision => 8, :scale => 2, :default => 0 
        t.decimal :weight, :precision => 10, :scale => 3, :default => 0
        t.text :description
        t.datetime :sales_starts_at
        t.datetime :sales_ends_at
        t.boolean :sales_status
        t.boolean :if_shown_on_web

      t.timestamps
    end
    add_index :taurus_products, :product_category_id
  end

end
