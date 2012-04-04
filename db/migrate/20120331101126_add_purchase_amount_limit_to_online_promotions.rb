class AddPurchaseAmountLimitToOnlinePromotions < ActiveRecord::Migration
  def change
    add_column :online_promotions, :purchase_amount_limit, :integer, :default => 0
  end
end
