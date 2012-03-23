class AlterProcedurePermissions < ActiveRecord::Migration
  def up
    add_column :procedure_permissions, :procedure_id, :integer
    add_column :procedure_permissions, :station_id, :integer
    add_index :procedure_permissions, [:procedure_id, :station_id]
    remove_column :procedure_permissions, :conditions
  end

  def down
    add_column :procedure_permissions, :conditions, :string
    remove_column :procedure_permissions, :procedure_id, :station_id
    remove_index :procedure_permissions, :procedure_id, :station_id
  end
end
