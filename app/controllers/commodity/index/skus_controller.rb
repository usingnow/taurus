class Commodity::Index::SkusController < ApplicationController
  layout "home"

  def index
    @skus = Sku.on_shelves.where("name like ?", "%#{params[:keywords]}%").paginate(:page => params[:page], :per_page => 20)
    @categories = SkuCategory.where("parent_id is null")
    @keywords = params[:keywords]
  end
end