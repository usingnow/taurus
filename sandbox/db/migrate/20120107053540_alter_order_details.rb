class AlterOrderDetails < ActiveRecord::Migration
  def self.up
    change_column :order_details, :unit_price, :decimal, :precision => 8, :scale => 2, :default => 0.00
    change_column :order_details, :install_cost, :decimal, :precision => 8, :scale => 2, :default => 0.00
    change_column :order_details, :assemble_cost, :decimal, :precision => 8, :scale => 2, :default => 0.00
    change_column :order_details, :other_cost, :decimal, :precision => 8, :scale => 2, :default => 0.00
  end

  def self.down
    change_column :order_details, :unit_price, :decimal, :precision => 10, :scale => 0, :default => nil
    change_column :order_details, :install_cost, :decimal, :precision => 10, :scale => 0,  :default => nil
    change_column :order_details, :assemble_cost, :decimal, :precision => 10, :scale => 0,  :default => nil
    change_column :order_details, :other_cost, :decimal, :precision => 10, :scale => 0,  :default => nil
  end
end
