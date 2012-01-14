class AlterOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :is_delivery, :boolean, :default => false  #是否可出库
    add_column :orders, :store_id, :integer
  end

  def self.down
    remove_column :orders, :is_delivery
    remove_column :orders, :store_id
  end
end
