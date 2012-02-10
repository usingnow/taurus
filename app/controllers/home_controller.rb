class HomeController < ApplicationController
  def index
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @oa_pc_skus = Sku.oa_pc_skus
    @oa_pc_hots = Sku.oa_pc_hots
    @office_skus = Sku.office_skus
    @office_hots = Sku.office_hots
    @daily_skus = Sku.daily_skus
    @daily_hots = Sku.daily_hots
    @off_fur_skus = Sku.off_fur_skus
    @off_fur_hots = Sku.off_fur_hots
    @liv_fur_skus = Sku.liv_fur_skus
    @liv_fur_hots = Sku.liv_fur_hots
    @fur_jew_skus = Sku.fur_jew_skus
    @fur_jew_hots = Sku.fur_jew_hots

    @images = {}
    Image.all.each do |image|
      @images.store(image.location, image.image.url)
    end

  end


end