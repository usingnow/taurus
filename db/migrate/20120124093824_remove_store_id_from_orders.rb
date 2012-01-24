class RemoveStoreIdFromOrders < ActiveRecord::Migration
  def self.up
    remove_column :orders, :store_id
  end

  def self.down
    add_column :orders, :store_id, :integer
  end
end
