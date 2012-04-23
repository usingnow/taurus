class AddDefaultToSkuProductships < ActiveRecord::Migration
  def change
    change_column_default :sku_productships, :package_num, 1
    change_column :sku_productships, :sales_bef_tax, :decimal, :precision => 8, :scale => 2, :default => 0.00
    change_column :sku_productships, :sales_aft_tax, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end
end
