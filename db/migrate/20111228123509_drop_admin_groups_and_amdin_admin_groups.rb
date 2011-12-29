class DropAdminGroupsAndAmdinAdminGroups < ActiveRecord::Migration
  def self.up
    drop_table :admin_groups
    drop_table :admins_admin_groups
  end

  def self.down
    create_table :admin_groups do |t|
      t.string :group_no       #组编号
      t.string :group_name     #组名称
      t.string :group_desc     #组描述

      t.timestamps
    end

    create_table :admins_admin_groups, :id=>false do |t|
      t.integer :admin_id
      t.integer :admin_group_id
    end

    add_index :admins_admin_groups, [:admin_id, :admin_group_id], :unique => true
    add_index :admins_admin_groups, :admin_group_id, :unique => false

  end
end
