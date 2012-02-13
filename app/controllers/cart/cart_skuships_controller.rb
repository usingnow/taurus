#encoding:UTF-8
class Cart::CartSkushipsController < ApplicationController
  layout "home"
  # GET /cart_skuships
  # GET /cart_skuships.xml
  def index
    @cart = current_cart
  end

  def create
    cart = current_cart

    current_cart_sku = cart.add_sku(params[:sku_id],params[:quantity])

    if current_cart_sku.save
      render :json => cart.total_items.to_json
    else
      render :json => "failure".to_json
    end
  end
end
