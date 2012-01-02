class Admin::StoreEntryProductCartsController < ApplicationController
  def create
    product_id = params[:product_id]

    render :partial => "products"
  end
end