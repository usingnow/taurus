class CreateSerialNumbers < ActiveRecord::Migration
  def self.up
    create_table :serial_numbers do |t|
      t.string :name
      t.string :date
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :serial_numbers
  end
end
