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

  def format_sku_status(value)
    if value == 1
      "已确认"
    else
      "暂停销售"
    end
  end

  def format_sku_sales_status(value)
    if value == 0
      "未上架"
    else
      "已上架"
    end
  end
end
