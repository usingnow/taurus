#encoding:UTF-8
module Admin::OrderPayHelper
  def format_order_pay_status(value)
    if value == 0
      "未付款"
    else
      "已付款"
    end
  end
end