class CreateTaurusPermissions < ActiveRecord::Migration
  def change
    create_table :taurus_permissions do |t|
      t.string :class_name
      t.string :action_name
      t.integer :permissionable_id
      t.string :permissionable_type

      t.timestamps
    end
    add_index :taurus_permissions, :permissionable_id
    add_index :taurus_permissions, :permissionable_type
  end
end