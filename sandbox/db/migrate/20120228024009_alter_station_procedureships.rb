class AlterStationProcedureships < ActiveRecord::Migration
  def up
    change_column :station_procedureships, :operate_url, :integer
    rename_column :station_procedureships, :operate_url, :order_oper_url_id
    remove_column :station_procedureships, :width, :height
  end

  def down
    rename_column :station_procedureships, :order_oper_url_id, :operate_url
    change_column :station_procedureships, :operate_url, :string
    add_column :station_procedureships, :width, :string
    add_column :station_procedureships, :height, :string
  end
end
