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
        and sku_id in(select id from skus where status = 1 and id in(select sku_id from sku_on_shelves where status = 1))")
    end
  end

end

