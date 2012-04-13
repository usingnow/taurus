class Commodity::SkuDetailsController < ApplicationController
  layout "home"

  def show
    @sku = Sku.find(params[:id])

    if current_user.nil?
      @sku_browsing_histories = Hash.new
    else
      @sku_browsing_history = @sku.add_browsing_history(current_user.id)
      @sku_browsing_history.save
      @sku_browsing_histories = SkuBrowsingHistory.limit(5).order("updated_at desc").where("user_id = #{current_user.id}
        and sku_id in(select id from skus where id in(select sku_id from sku_on_shelves where status = 1))")
    end

    @online_promotions = []
    OnlinePromotion.progress_product_promotions.order_by_created_at.each do |p|
      case p.online_promotionable.products_selection
        when 0
          @online_promotions << p
        when 1
          ids = []
          p.promotion_products.each { |s| ids += s.sku_category.children.map(&:id)+s.product_info.to_a }
          @online_promotions << p if ids.member?(@sku.sku_category_id)
        when 2
          ids = p.promotion_products.map(&:product_info)
          @online_promotions << p if ids.member?(@sku.brand_id)
        when 3
          ids = p.promotion_products.map(&:product_info)
          @online_promotions << p if ids.member?(@sku.id)
      end
    end

  end

end

