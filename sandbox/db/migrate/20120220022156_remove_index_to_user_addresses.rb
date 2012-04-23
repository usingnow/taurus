class RemoveIndexToUserAddresses < ActiveRecord::Migration
  def up
    remove_index :user_addresses, :user_id
  end

  def down
    add_index :user_addresses, :user_id, :unique => true
  end
end
