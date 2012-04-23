class CreateOrderNumbers < ActiveRecord::Migration
  def self.up
    create_table :order_numbers do |t|
      t.date :date
      t.integer :seq

      t.timestamps
    end
  end

  def self.down
    drop_table :order_numbers
  end
end
