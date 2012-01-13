class Admin::InnerSkuCartsController < ApplicationController
  before_filter :authenticate_administrator!

  # GET /cart_skuships
  # GET /cart_skuships.xml
  def index
    @cart_skuships = CartSkuship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cart_skuships }
    end
  end

  # GET /cart_skuships/1
  # GET /cart_skuships/1.xml
  def show
    @cart_skuship = CartSkuship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cart_skuship }
    end
  end

  # GET /cart_skuships/new
  # GET /cart_skuships/new.xml
  def new
    @cart_skuship = CartSkuship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cart_skuship }
    end
  end

  # GET /cart_skuships/1/edit
  def edit
    @cart_skuship = CartSkuship.find(params[:id])
  end


  def create
    sku_id = params[:sku_id]
    @inner_sku_cart = InnerSkuCart.find_by_sku_id_and_user_id(sku_id,session[:user_id])
    if @inner_sku_cart.nil?
      @inner_sku_cart = InnerSkuCart.new(:sku_id=>sku_id,:user_id=>session[:user_id])
    else
      @inner_sku_cart.quantity+=1
    end
    @inner_sku_cart.save

    @inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
  end


  def update
    value = params[:value]

    @inner_sku_cart = InnerSkuCart.find(params[:id])
    @inner_sku_cart.update_attributes(:quantity => value)
    @inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
  end

  # DELETE /cart_skuships/1
  # DELETE /cart_skuships/1.xml
  def destroy
    @inner_sku_cart = InnerSkuCart.find(params[:id])
    @inner_sku_cart.destroy

    @inner_sku_carts = InnerSkuCart.find_all_by_user_id(session[:user_id])
  end
end