#encoding:UTF-8
module Commodity::SkuDetailsHelper
  def current_category_site
    if @sku.sku_category_id.nil?
      "无"
    else
      str = ''
      category = @sku.sku_category

      unless category.nil?
        while category do
          str = "#{link_to category.name, commodity_category_path(category)} >>" + str
          category = category.parent
        end
      end

      str
    end
  end

  def get_sku_inventory(sku)
    if current_user.nil?
      flag = sku.inventory?(1,1)
    else
      flag = sku.inventory?(1,current_user.store_id)
    end

    if flag
      "有"
    else
      "无"
    end
  end
end
