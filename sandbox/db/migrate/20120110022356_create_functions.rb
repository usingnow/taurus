class CreateFunctions < ActiveRecord::Migration
  def self.up
    create_table :functions do |t|
      t.integer :component_id
      t.string :name
      t.string :description
      t.string :subject_class

      t.timestamps
    end
  end

  def self.down
    drop_table :functions
  end
end
