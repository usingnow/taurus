class CreateTaurusReplenishmentRecords < ActiveRecord::Migration
  def change
    create_table :taurus_replenishment_records do |t|
      t.string :number
      t.string :supplier
      t.integer :replenishment_type, :default => 0
      t.string :remarks
      t.integer :administrator_id, :null => false


      t.timestamps
    end
    add_index :taurus_replenishment_records, :number, :unique => true
    add_index :taurus_replenishment_records, :administrator_id
  end
end
