class AlterOrderPrintLog < ActiveRecord::Migration
  def self.up
    remove_column :order_print_logs, :created_by
    remove_column :order_print_logs, :print_type
    rename_column :order_print_logs, :admin_id, :administrator_id
  end

  def self.down
    add_column :order_print_logs, :created_by, :string
    add_column :order_print_logs, :print_type, :integer
    rename_column :order_print_logs, :administrator_id, :admin_id
  end
end
