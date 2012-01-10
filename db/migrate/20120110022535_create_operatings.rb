class CreateOperatings < ActiveRecord::Migration
  def self.up
    create_table :operatings do |t|
      t.integer :function_id
      t.string :name
      t.string :description
      t.string :action

      t.timestamps
    end
  end

  def self.down
    drop_table :operatings
  end
end
