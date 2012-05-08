class CreateProcedurePermissions < ActiveRecord::Migration
  def change
    create_table :procedure_permissions do |t|
      t.integer :group_id
      t.integer :condition_id
      t.string :conditions

      t.timestamps
    end

    add_index :procedure_permissions, [:group_id,:condition_id]
  end
end
