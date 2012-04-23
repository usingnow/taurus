class AlterUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :password
    remove_column :users, :question
    remove_column :users, :answer
    remove_column :users, :last_login_time
  end

  def self.down
    add_column :users, :password, :string
    add_column :users, :question, :sring
    add_column :users, :answer, :string
    add_column :users, :last_login_time, :datetime
  end
end
