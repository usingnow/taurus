class Promotion::PromotionByProductsController < ApplicationController
  before_filter :authenticate_administrator!

  def new
    @promotion_by_product = PromotionByProduct.new
    @promotion_by_product.online_promotion = OnlinePromotion.new
  end
end