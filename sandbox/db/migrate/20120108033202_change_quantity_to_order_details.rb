class ChangeQuantityToOrderDetails < ActiveRecord::Migration
  def self.up
    change_column_default :order_details, :quantity, 1
    change_column_default :order_details, :is_need_assemble, 0
    change_column_default :order_details, :is_need_install, 0
  end

  def self.down
    change_column_default :order_details, :quantity, nil
    change_column_default :order_details, :is_need_assemble, nil
    change_column_default :order_details, :is_need_install, nil
  end
end
