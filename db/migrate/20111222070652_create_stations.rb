class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string :name
      t.string :display_name
      t.string :condition_function
      t.string :business_function
      t.integer :station_type
      t.integer :sequence
      t.integer :safe_quantity

      t.timestamps
    end
  end

  def self.down
    drop_table :stations
  end
end
