class CreatePromotionGifts < ActiveRecord::Migration
  def change
    create_table :promotion_gifts do |t|
      t.integer :order_id
      t.integer :sku_id
      t.integer :amount, :default => 1

      t.timestamps
    end
    add_index :promotion_gifts, :order_id
    add_index :promotion_gifts, :sku_id
  end
end
