class CreateAdminsAdminGroups < ActiveRecord::Migration
  def self.up
    create_table :admins_admin_groups, :id=>false do |t|
      t.integer :admin_id
      t.integer :admin_group_id
    end

    add_index :admins_admin_groups, [:admin_id, :admin_group_id], :unique => true
    add_index :admins_admin_groups, :admin_group_id, :unique => false
  end

  def self.down
    drop_table :admins_admin_groups
  end
end
