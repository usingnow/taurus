#encoding:UTF-8
module Admin::OrderTakeLogsHelper
  def format_order_take_log_type(value)
    if value == 0
      "取消接管"
    else
      "接管"
    end
  end
end