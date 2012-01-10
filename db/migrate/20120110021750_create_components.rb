class CreateComponents < ActiveRecord::Migration
  def self.up
    create_table :components do |t|
      t.integer :system_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :components
  end
end
