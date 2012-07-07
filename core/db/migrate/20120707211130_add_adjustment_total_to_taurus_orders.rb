class AddAdjustmentTotalToTaurusOrders < ActiveRecord::Migration
  def change
    add_column :taurus_orders, :adjustment_total, :decimal, :precision => 8, :scale => 2, :default => 0
  end

end
