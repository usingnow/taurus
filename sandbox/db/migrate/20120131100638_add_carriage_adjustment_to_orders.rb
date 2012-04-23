class AddCarriageAdjustmentToOrders < ActiveRecord::Migration
  def self.up
    add_column :orders, :carriage_adjustment, :decimal, :precision => 8, :scale => 2, :default => 0.0
    execute("update orders set carriage_adjustment = carriage_cost")
  end

  def self.down
    remove_column :orders, :carriage_adjustment
  end
end
