#encoding:UTF-8
module Store::DeliveryOrdersHelper
  def format_delivery_type(value)
    if value.blank?
      "其他"
    else
      "订单出库"
    end
  end
end
