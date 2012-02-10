#encoding:UTF-8
module Commodity::SkuDetailsHelper
  def current_category_site(object, options={}, &block)
    if @sku.sku_category_id.nil?
      "无"
    else
      str = ''
      category = @sku.sku_category

      unless category.nil?
        while category do
          str = "#{link_to category.name} >>" + str
          category = category.parent
        end
      end

      str
    end

  end

end
