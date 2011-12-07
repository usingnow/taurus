class CreateAdminGroups < ActiveRecord::Migration
  def self.up
    create_table :admin_groups do |t|
      t.string :group_no       #组编号
      t.string :group_name     #组名称
      t.string :group_desc     #组描述

      t.timestamps
    end
  end

  def self.down
    drop_table :admin_groups
  end
end
