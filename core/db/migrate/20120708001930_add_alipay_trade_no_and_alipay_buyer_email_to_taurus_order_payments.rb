class AddAlipayTradeNoAndAlipayBuyerEmailToTaurusOrderPayments < ActiveRecord::Migration
  
  def change
    add_column :taurus_order_payments, :alipay_trade_no, :string
    add_column :taurus_order_payments, :alipay_buyer_email, :string
  end

end
