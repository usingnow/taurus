#encoding:UTF-8
class Cart::CartSkushipsController < ApplicationController
  layout "home"
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

  # POST /cart_skuships
  # POST /cart_skuships.xml
  def create
    @cart = current_cart
    sku = Sku.find(params[:sku_id])
    @cart_skuship = @cart.add_sku(sku.id)

    respond_to do |format|
        if @cart_skuship.save
          format.html { redirect_to(cart_skuships_url) }
          format.xml  { render :xml => @cart_skuship, :status => :created, :location => @cart_skuship }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @cart_skuship.errors, :status => :unprocessable_entity }
        end
    end
  end

  # PUT /cart_skuships/1
  # PUT /cart_skuships/1.xml
  def update
    @cart_skuship = CartSkuship.find(params[:id])

    respond_to do |format|
      if @cart_skuship.update_attributes(params[:cart_skuship])
        format.html { redirect_to(@cart_skuship, :notice => 'Cart skuship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cart_skuship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_skuships/1
  # DELETE /cart_skuships/1.xml
  def destroy
    @cart_skuship = CartSkuship.find(params[:id])
    @cart_skuship.destroy

    respond_to do |format|
      format.html { redirect_to(cart_skuships_url) }
      format.xml  { head :ok }
    end
  end
end
