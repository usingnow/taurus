class CreatePromotionsInOrders < ActiveRecord::Migration
  def change
    create_table :promotions_in_orders do |t|
      t.integer :order_id
      t.integer :online_promotion_id

      t.timestamps
    end
    add_index :promotions_in_orders, :order_id
    add_index :promotions_in_orders, :online_promotion_id
  end
end
