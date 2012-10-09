class AddDeliveryPaymentTypeToTaurusOrderPayments < ActiveRecord::Migration
  
  def change
    add_column :taurus_order_payments, :delivery_payment_type, :integer
  end

end