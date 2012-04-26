#encoding:UTF-8
module Commodity::Admin::SkusHelper
  def format_sku_type(value)
    Sku::SKU_TYPE[value]
  end

  def format_sku_status(value)
    format_value value, {0 => "未确认", 1 => "开始销售", 2 => "暂停销售"}
  end

  def format_sku_shelf_status(value)
    format_value value, {false => "未上架", true => "已上架"}
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

  def sku_status_link(object)
    if object.status == 2
      confirm = "确定修改此商品为开始销售么？"
    else
      confirm = "确定修改此商品为暂停销售么？"
    end
    link_to (format_sku_status object.status), update_status_commodity_admin_sku_path(object.id), :confirm => confirm, :method => :put
  end
end
