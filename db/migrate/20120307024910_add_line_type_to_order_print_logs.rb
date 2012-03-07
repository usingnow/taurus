class AddLineTypeToOrderPrintLogs < ActiveRecord::Migration
  def change
    add_column :order_print_logs, :line_type, :integer
  end
end
