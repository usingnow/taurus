#encoding:UTF-8
module ApplicationHelper
  def format_sku_type(type)
    if type == 1
      "在库品"
    elsif type == 2
      "直送品"
    end
  end
end
