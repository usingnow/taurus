class HomeController < ApplicationController
  def index
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = SkuDisplay.order("sequence desc").find_all_by_page_and_location(0,0)
    @oa_pc_skus = Sku.category_skus '01'
    @oa_pc_hots = Sku.category_hots '01'
    @office_skus = Sku.category_skus '02'
    @office_hots = Sku.category_hots '02'
    @daily_skus = Sku.category_skus '03'
    @daily_hots = Sku.category_hots '03'
    @off_fur_skus = Sku.category_skus '04'
    @off_fur_hots = Sku.category_hots '04'
    @liv_fur_skus = Sku.category_skus '05'
    @liv_fur_hots = Sku.category_hots '05'
    @fur_jew_skus = Sku.category_skus '06'
    @fur_jew_hots = Sku.category_hots '06'

    @images = {}
    Image.find_all_by_page(0).each do |image|
      @images.store(image.location, image.image.url)
    end

  end


end