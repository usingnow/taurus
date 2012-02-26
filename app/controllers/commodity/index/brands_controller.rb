class Commodity::Index::BrandsController < ApplicationController
  layout "home"

  def show
    @brand = Brand.find(params[:id])
    @search = @brand.skus.on_shelves.search(params[:q])
    if @search.sorts.empty?
      @search.sorts = "total_sale desc"
    end
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
  end
end