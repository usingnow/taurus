class AddDeRemarksToDeliveryOrders < ActiveRecord::Migration
  def change
    add_column :delivery_orders, :de_remarks, :text
  end
end
