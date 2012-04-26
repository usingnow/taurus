#encoding:UTF-8
module Commodity::Admin::SkuOnShelvesHelper
  def format_sku_on_shelf_status(value)
    hash = {0 => "无效",  1 => "有效", 2 => "无效" }
    format_value value, hash
  end

  def get_sku_on_shelf_operating(value,sku_on_shelf,sku)
    if value == 1
      name = '无效'
      status = 2
      confirm = '确认修改为无效？'
    else
      name = '有效'
      status = 1
      confirm = '确认修改为有效？'
    end

    link_to name, commodity_admin_sku_sku_on_shelf_path(sku,sku_on_shelf, :status => status), :confirm => confirm,
            :method => :put
  end
end