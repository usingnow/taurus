class AddStoreInTypeToStoreEntries < ActiveRecord::Migration
  def self.up
    add_column :store_entries, :store_in_type, :integer, :default => 0
    execute("update store_entries set store_in_type = 1 where purchase_order_id is not null")
    execute("update store_entries set store_in_type = 4 where purchase_order_id is null")
  end

  def self.down
    remove_column :store_entries, :store_in_type
  end
end
