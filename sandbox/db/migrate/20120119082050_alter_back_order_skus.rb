class AlterBackOrderSkus < ActiveRecord::Migration
  def self.up
    remove_column :back_order_skus, :install_price
    remove_column :back_order_skus, :assembling_price
    remove_column :back_order_skus, :delivery_date
    remove_column :back_order_skus, :total_amount
  end

  def self.down
    add_column :back_order_skus, :install_price, :decimal, :precision => 10, :scale => 0, :default => 0
    add_column :back_order_skus, :assembling_price, :decimal, :precision => 10, :scale => 0, :default => 0
    add_column :back_order_skus, :delivery_date, :date
    add_column :back_order_skus, :total_amount, :decimal, :precision => 10, :scale => 0, :default => 0
  end
end
