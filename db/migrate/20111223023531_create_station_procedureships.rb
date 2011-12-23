class CreateStationProcedureships < ActiveRecord::Migration
  def self.up
    create_table :station_procedureships do |t|
      t.integer :procedure_id
      t.integer :station_id
      t.integer :condition
      t.integer :next_station_id
      t.string :business_function
      t.string :operate_url
      t.string :target
      t.integer :width
      t.integer :height
      t.boolean :active
      t.integer :sequence
      t.integer :sub_sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :station_procedureships
  end
end
