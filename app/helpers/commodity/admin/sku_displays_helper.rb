module Commodity::Admin::SkuDisplaysHelper
  def get_sku_display_page(page)
    SkuDisplay.new.page_enum[page]
  end

  def get_sku_display_location(page, location)
    SkuDisplay.new.location_enum(page)[location]
  end
end