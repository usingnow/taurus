class HomeController < ActionController::Base
  def index
    @slider_bars = SliderBar.limit(5).all
    @categories = SkuCategory.find_all_by_is_show_in_navigation_and_is_show_in_column_and_active_and_parent_id(
                  true,true,true,nil)
    @recommendation = Sku.recommendation
    @oa_pc_skus = Sku.oa_pc_skus
    @oa_pc_hots = Sku.oa_pc_hots
  end


end