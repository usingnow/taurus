class CreateCustomerRatings < ActiveRecord::Migration
  def change
    create_table :customer_ratings do |t|
      t.integer :user_id
      t.integer :sku_id
      t.integer :rating, :default => 0
      t.string :comment
      t.integer :administrator_id
      t.string :reply

      t.timestamps
    end
    add_index :customer_ratings, :user_id
    add_index :customer_ratings, :sku_id
    add_index :customer_ratings, :administrator_id
  end
end
