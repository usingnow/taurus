class CreatePickUps < ActiveRecord::Migration
  def self.up
    create_table :pick_ups do |t|
      t.string :name
      t.string :href

      t.timestamps
    end
  end

  def self.down
    drop_table :pick_ups
  end
end
