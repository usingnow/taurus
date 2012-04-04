class AddPurchaseAmountLimitToPromotionByOrders < ActiveRecord::Migration
  def change
    add_column :promotion_by_orders, :purchase_amount_limit, :integer, :default => 0
  end
end
