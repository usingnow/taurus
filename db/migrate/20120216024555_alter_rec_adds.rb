class AlterRecAdds < ActiveRecord::Migration
  def up
    rename_table :rec_adds, :user_addresses
    add_index :user_addresses, :user_id, :unique => true
  end

  def down
    rename_table :user_addresses, :rec_adds
    remove_index :user_addresses, :user_id
  end
end
