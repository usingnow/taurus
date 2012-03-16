#encoding:UTF-8
module Commodity::Admin::ProductsHelper
  def format_product_inventory(value)
    { true => "有", false => "无" }[value]
  end
end
