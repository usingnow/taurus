class ChangeDefaultToDiscountOnPromotionByOrders < ActiveRecord::Migration
  def up
    change_column_default :promotion_by_orders, :discount, 1
  end

  def down
    change_column_default :promotion_by_orders, :discount, 0
  end
end
