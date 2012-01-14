class AddSalesReservedToProductStoreships < ActiveRecord::Migration
  def self.up
    add_column :product_storeships, :sales_reserved, :integer, :default => 0
    change_column_default :product_storeships, :quantity, 0
    change_column_default :product_storeships, :stockout, 0
  end

  def self.down
    remove_column :product_storeships, :sales_reserved
    change_column_default :product_storeships, :quantity, nil
    change_column_default :product_storeships, :stockout, nil
  end
end
