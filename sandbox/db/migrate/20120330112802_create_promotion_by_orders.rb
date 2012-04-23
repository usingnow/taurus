class CreatePromotionByOrders < ActiveRecord::Migration
  def change
    create_table :promotion_by_orders do |t|
      t.decimal :order_payment_over, :precision => 8, :scale => 2, :default => 0.00
      t.decimal :discount, :precision => 8, :scale => 2, :default => 0.00
      t.boolean :free_delivery, :default => false

      t.timestamps
    end
  end
end
