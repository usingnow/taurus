class CreatePromotionProducts < ActiveRecord::Migration
  def change
    create_table :promotion_products do |t|
      t.integer :online_promotion_id
      t.integer :product_info

      t.timestamps
    end
    add_index :promotion_products, :online_promotion_id
    add_index :promotion_products, :product_info
  end
end
