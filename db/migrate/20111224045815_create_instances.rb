class CreateInstances < ActiveRecord::Migration
  def self.up
    create_table :instances do |t|
      t.integer :station_id
      t.integer :procedure_id

      t.timestamps
    end
  end

  def self.down
    drop_table :instances
  end
end
