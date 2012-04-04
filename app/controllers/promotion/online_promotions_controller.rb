class Promotion::OnlinePromotionsController < ApplicationController
  before_filter :authenticate_administrator!

  def index

  end

  def search_skus
    @search = Sku.search(params[:q])
    @search.sorts = "updated_at desc"
    @skus = @search.result.paginate(:page => params[:page], :per_page => 20)
    render "search_skus", :layout => "empty"
  end
end