class AddForeignKeToOrder < ActiveRecord::Migration
  def self.up
    remove_column :orders, :total_price
  end

  def self.down
    add_column :orders, :total_price, :decimal, :precision => 8, :scale => 2, :default => 0.0
  end
end
