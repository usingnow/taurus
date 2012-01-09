class AddRoleIdToPersonExtends < ActiveRecord::Migration
  def self.up
    add_column :person_extends, :role_id, :integer
  end

  def self.down
    remove_column :person_extends, :role_id
  end
end
