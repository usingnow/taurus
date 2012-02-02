#encoding:UTF-8
module Admin::SkusHelper
  def format_sku_type(type)
    if type == 1
      "在库品"
    elsif type == 2
      "直送品"
    elsif type == 3
      "非在库"
    elsif type == 4
      "未定"
    elsif type ==5
      "劳务费用"
    end
  end

  def get_sku_type(object)
    if object.order_details.empty?
      ""
    else
      format_sku_type object.order_details[0].sku.sku_type
    end
  end

  def format_sku_status(value)
    if value == 1
      "开始销售"
    elsif value == 2
      "暂停销售"
    end
  end

  def format_sku_sales_status(value)
    if value == 0
      "未上架"
    elsif value == 1
      "已上架"
    end
  end
end
