#encoding:UTF-8
module Commodity::SkusHelper
  def format_sku_type(value)
    format_value value, {1 => "在库品", 2 => "直送品", 3 => "非在库", 4 => "未定", 5 => "劳务费用"}
  end

  def format_sku_status(value)
    format_value value, {1 => "开始销售", 2 => "暂停销售"}
  end

  def format_sku_sales_status(value)
    format_value value, {0 => "未上架", 1 => "已上架"}
  end

  def get_sku_type(object)
    if object.nil?
      "无"
    else
      if object.order_details.empty?
        "无"
      else
        format_sku_type object.order_details[0].sku.sku_type
      end
    end
  end
end
