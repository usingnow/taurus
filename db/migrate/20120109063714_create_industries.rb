class CreateIndustries < ActiveRecord::Migration
  def self.up
    create_table :industries do |t|
      t.string :name
      t.integer :sequence

      t.timestamps
    end
  end

  def self.down
    drop_table :industries
  end
end
