class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :instance_id
      t.integer :station_id
      t.integer :condition_id
      t.integer :next_station_id
      t.string :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
