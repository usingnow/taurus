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

  def update
    cart_skuship = CartSkuship.find params[:id]
    cart = Cart.find session[:cart_id]

    if !params[:quantity].nil?
      cart_skuship.update_attributes(:quantity => params[:quantity])
      prices = {:total_sku_amount => cart.total_sku_amount, :total_amount => cart.total_amount,
                :subtotal => cart_skuship.total_amount}
      render :json => prices.to_json
    elsif !params[:is_need_install].nil?
      cart_skuship.update_attributes(:is_need_install => params[:is_need_install])
      prices = {:total_installation_amount => cart.total_installation_amount, :total_amount => cart.total_amount,
                :subtotal => cart_skuship.total_amount}
      render :json => prices.to_json
    end
  end

  def current_skus
    if session[:cart_id].nil?
      render :json => "0".to_json
    else
      cart = Cart.find session[:cart_id]
      render :json => cart.total_items.to_json
    end
  end
end
