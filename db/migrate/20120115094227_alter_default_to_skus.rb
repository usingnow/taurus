class AlterDefaultToSkus < ActiveRecord::Migration
  def self.up
    change_column_default :skus, :status, 2
    change_column_default :skus, :sales_status, 0
  end

  def self.down
    change_column_default :skus, :status, nil
    change_column_default :skus, :sales_status, nil
  end
end
