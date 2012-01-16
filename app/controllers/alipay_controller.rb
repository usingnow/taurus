class AlipayController < ApplicationController
  def index
    @order_pay = OrderPay.new

  end
end