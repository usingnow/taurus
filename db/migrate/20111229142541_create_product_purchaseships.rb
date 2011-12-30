class CreateProductPurchaseships < ActiveRecord::Migration
  def self.up
    create_table :product_purchaseships do |t|
      t.integer :product_id
      t.integer :purchase_id
      t.integer :quantity
      t.decimal :unit_price_aft_tax
      t.decimal :total_amount
      t.date :delivery_date

      t.timestamps
    end
  end

  def self.down
    drop_table :product_purchaseships
  end
end
