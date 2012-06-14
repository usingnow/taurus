module Taurus
	module Admin
		class ProductSkuLineItemsController < BaseController
			autocomplete :sku, :name, :class_name => "Taurus::Sku"

			def index
		    @product = Product.find(params[:product_id])
		    @product_sku_line_item = ProductSkuLineItem.new
		  end

		  def show
        @product = Product.find(params[:product_id])
		  end

		  def show_sku
        @sku = Sku.find(params[:id])
		  end

		  def create
		  	@product = Product.find(params[:product_id])

		  	@product.product_sku_line_items.destroy_all
		  	params[:sku_amount].each do |key,value|
	  			@product.product_sku_line_items << ProductSkuLineItem.new(:sku_id => key, :sku_amount => value)
		  	end if params[:sku_amount]
		  	if @product.save
		  		flash[:success] = I18n.t(:successfully_updated)
		  	end
		  	redirect_to(admin_product_product_sku_line_items_url(@product))
		  end	
    end
  end
end    