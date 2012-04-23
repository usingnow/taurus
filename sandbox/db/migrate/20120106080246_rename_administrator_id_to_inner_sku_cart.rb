class RenameAdministratorIdToInnerSkuCart < ActiveRecord::Migration
  def self.up
    rename_column :inner_sku_carts, :administrator_id, :user_id
  end

  def self.down
    rename_column :inner_sku_carts, :user_id, :administrator_id
  end
end
