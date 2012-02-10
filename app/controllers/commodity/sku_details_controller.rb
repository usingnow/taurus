class Commodity::SkuDetailsController < ApplicationController
  layout "home"

  def show
    @sku = Sku.find(params[:id])
  end

end

