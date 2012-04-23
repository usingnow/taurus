class CreateProcedures < ActiveRecord::Migration
  def self.up
    create_table :procedures do |t|
      t.string :name
      t.string :display_name
      t.boolean :active
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :procedures
  end
end
