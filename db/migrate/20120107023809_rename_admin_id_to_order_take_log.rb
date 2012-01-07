class RenameAdminIdToOrderTakeLog < ActiveRecord::Migration
  def self.up
    rename_column :order_take_logs, :admin_id, :administrator_id
  end

  def self.down
    rename_column :order_take_logs, :administrator_id, :admin_id
  end
end
