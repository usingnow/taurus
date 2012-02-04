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
end
