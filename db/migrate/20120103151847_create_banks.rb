class CreateBanks < ActiveRecord::Migration
  def self.up
    create_table :banks do |t|
      t.string :number
      t.string :account_no
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :banks
  end
end
