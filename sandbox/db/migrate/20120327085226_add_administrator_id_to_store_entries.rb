class AddAdministratorIdToStoreEntries < ActiveRecord::Migration
  def self.up
    add_column :store_entries, :administrator_id, :integer
    add_index :store_entries, :administrator_id
    execute "update store_entries set administrator_id = #{Administrator.first.id}"
  end

  def self.down
    remove_index :store_entries, :administrator_id
    remove_column :store_entries, :administrator_id
  end
end
