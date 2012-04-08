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

  def edit
    @customer_rating = CustomerRating.find(params[:id])
  end

  def update
    @customer_rating = CustomerRating.find(params[:id])
    @customer_rating.administrator_id = current_administrator.id
    @customer_rating.current_action = "reply"
    if @customer_rating.update_attributes(params[:customer_rating])
      redirect_to admin_customer_rating_url(@customer_rating)
    else
      render "edit"
    end
  end

  def destroy
    @customer_rating = CustomerRating.find(params[:id])
    @customer_rating.destroy
    redirect_to admin_customer_ratings_url
  end

  def close
    @customer_rating = CustomerRating.find(params[:id])
    @customer_rating.update_attribute(:visibility,false)
    redirect_to admin_customer_rating_url(@customer_rating)
  end
end