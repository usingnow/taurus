class RemoveLastLoginTimeToAdministrators < ActiveRecord::Migration
  def self.up
    remove_column :administrators, :last_login_time
  end

  def self.down
    add_column :administrators, :last_login_time, :datetime
  end
end
