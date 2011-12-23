class AlterStationProcedureship < ActiveRecord::Migration
  def self.up
    rename_column :station_procedureships, :condition, :condition_id
    rename_column :station_procedureships, :business_function, :business_function_id
    change_column :station_procedureships, :business_function_id, :integer
  end

  def self.down
    rename_column :station_procedureships, :condition_id, :condition
    rename_column :station_procedureships, :business_function_id, :business_function
    change_column :station_procedureships, :business_function, :string
  end
end
