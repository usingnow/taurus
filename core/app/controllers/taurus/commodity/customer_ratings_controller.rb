#encoding:UTF-8
class Commodity::CustomerRatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @sku = Sku.find(params[:sku_detail_id])
    @customer_rating = @sku.customer_ratings.build(params[:customer_rating].merge({:user_id => current_user.id}))
    if @customer_rating.save
      alert = '评论成功'
    else
      alert = '评论失败'
    end
    redirect_to commodity_sku_detail_path(@sku), :alert => alert
  end
end