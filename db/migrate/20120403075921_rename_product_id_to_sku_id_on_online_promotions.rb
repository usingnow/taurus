class RenameProductIdToSkuIdOnOnlinePromotions < ActiveRecord::Migration
  def up
    rename_column :online_promotions, :product_id, :sku_id
  end

  def down
    rename_column :online_promotions, :sku_id, :product_id
  end
end
