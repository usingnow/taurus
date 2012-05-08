class AlterInnerSkuCarts < ActiveRecord::Migration
  def self.up
    rename_table :inner_sku_carts, :back_order_skus
  end

  def self.down
    rename_table :back_order_skus, :inner_sku_carts
  end
end
