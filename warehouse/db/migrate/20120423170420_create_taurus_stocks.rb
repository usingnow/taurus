class CreateTaurusStocks < ActiveRecord::Migration
  def change
    create_table :taurus_stocks do |t|
      t.integer :product_id, :null => false
      t.integer :reserved, :default => 0
      t.integer :in_stock, :default => 0


      t.timestamps
    end
    add_index :taurus_stocks, :product_id
  end
end
