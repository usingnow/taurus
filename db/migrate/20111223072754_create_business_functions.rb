class CreateBusinessFunctions < ActiveRecord::Migration
  def self.up
    create_table :business_functions do |t|
      t.string :name
      t.string :function

      t.timestamps
    end
  end

  def self.down
    drop_table :business_functions
  end
end
