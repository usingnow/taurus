class AddPoTimeOfDeliveryToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :po_time_of_delivery, :datetime
  end
end
