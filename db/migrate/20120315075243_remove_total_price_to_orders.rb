class RemoveTotalPriceToOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :total_price
  end

  def down
    add_column :orders, :total_price, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end
end
