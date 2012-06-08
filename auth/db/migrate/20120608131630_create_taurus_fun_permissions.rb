class CreateTaurusFunPermissions < ActiveRecord::Migration
  def change
    create_table :taurus_fun_permissions do |t|
      t.integer :group_id
      t.string :operation_id

      t.timestamps
    end
    add_index :taurus_fun_permissions, :group_id
    add_index :taurus_fun_permissions, :operation_id
  end
end