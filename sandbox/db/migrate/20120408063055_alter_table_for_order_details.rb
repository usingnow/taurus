class AlterTableForOrderDetails < ActiveRecord::Migration
  def up
    change_column :order_details, :is_need_install, :boolean, :default => false
    change_column :order_details, :is_need_assemble, :boolean, :default => false
    add_index :order_details, :sku_id
    add_index :order_details, :order_id
    add_index :order_details, :created_admin_id
    add_index :order_details, :updated_admin_id
  end

  def down
    change_column :order_details, :is_need_install, :integer, :default => 0
    change_column :order_details, :is_need_assemble, :integer, :default => 0
    remove_index :order_details, :sku_id
    remove_index :order_details, :order_id
    remove_index :order_details, :created_admin_id
    remove_index :order_details, :updated_admin_id
  end
end
