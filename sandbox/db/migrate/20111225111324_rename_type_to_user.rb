class RenameTypeToUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :type, :user_type
  end

  def self.down
    rename_column :users, :user_type, :type
  end
end
