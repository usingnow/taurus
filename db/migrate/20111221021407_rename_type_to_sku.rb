class RenameTypeToSku < ActiveRecord::Migration
  def self.up
    rename_column :skus, :type, :sku_type
  end

  def self.down
    rename_column :skus, :sku_type, :type
  end
end
