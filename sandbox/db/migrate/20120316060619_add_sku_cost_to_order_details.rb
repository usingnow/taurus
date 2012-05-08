class AddSkuCostToOrderDetails < ActiveRecord::Migration
  def change
    add_column :order_details, :sku_cost, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end
end
