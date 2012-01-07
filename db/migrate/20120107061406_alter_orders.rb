class AlterOrders < ActiveRecord::Migration
  def self.up
    change_column_default :orders, :other_cost, 0.00
    change_column_default :orders, :carriage_cost, 0.00
    change_column_default :orders, :total_price, 0.00
  end

  def self.down
    change_column_default :orders, :other_cost, nil
    change_column_default :orders, :carriage_cost, nil
    change_column_default :orders, :total_price, nil
  end
end
