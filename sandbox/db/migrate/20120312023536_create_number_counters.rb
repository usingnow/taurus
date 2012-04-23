class CreateNumberCounters < ActiveRecord::Migration
  def change
    create_table :number_counters do |t|
      t.string :name
      t.string :date
      t.integer :sequence

      t.timestamps
    end
    add_index :number_counters, :name, :unique => true
  end
end
