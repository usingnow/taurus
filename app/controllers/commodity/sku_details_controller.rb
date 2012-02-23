class Commodity::SkuDetailsController < ApplicationController
  layout "home"

  def show
    @sku = Sku.find(params[:id])

    unless current_user.nil?
      @sku_browsing_history = @sku.add_browsing_history(current_user.id)
      @sku_browsing_history.save
    end
  end

end

