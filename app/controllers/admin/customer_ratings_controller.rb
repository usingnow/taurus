class Admin::CustomerRatingsController < ApplicationController
  before_filter :authenticate_administrator!
  authorize_resource

  def index
    @search = CustomerRating.search(params[:q])
    @search.sorts = "updated_at desc"
    @customer_ratings = @search.result.paginate(:page => params[:page], :per_page => 20)
  end

  def show
    @customer_rating = CustomerRating.find(params[:id])
  end
end