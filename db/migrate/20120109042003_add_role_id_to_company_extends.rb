class AddRoleIdToCompanyExtends < ActiveRecord::Migration
  def self.up
    add_column :company_extends, :role_id, :integer
  end

  def self.down
    remove_column :company_extends, :role_id
  end
end
