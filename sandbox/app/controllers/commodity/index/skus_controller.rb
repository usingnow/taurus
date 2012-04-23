class Commodity::Index::SkusController < ApplicationController
  layout "home"

  def index
    @search = Sku.on_shelves.search(params[:q])
    if @search.sorts.empty?
      @search.sorts = "total_sale desc"
    end
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
    @categories = SkuCategory.where("parent_id is null")
    @keywords = params[:q][:name_or_number_cont]
  end
end