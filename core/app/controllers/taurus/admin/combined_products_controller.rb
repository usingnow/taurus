module Taurus
	module Admin
		class CombinedProductsController < BaseController
			autocomplete :product, :name, :class_name => "Taurus::Product", :extra_data => [:number], :scopes => [:single]
      
      def index
        @product = Product.find(params[:product_id])
      end

			def new
        @product = Product.find(params[:product_id])
        @combined_product = CombinedProduct.new
			end

			def create
		  	@product = Product.find(params[:product_id])
        
		  	@product.combined_products.destroy_all
		  	params[:amount].each do |key, value|
	  			@product.combined_products << CombinedProduct.new(:related_id => key, :amount => value)
		  	end if params[:amount]
		  	if @product.save
		  		flash[:success] = I18n.t(:successfully_updated)
		  	end
		  	redirect_to(new_admin_product_combined_product_url(@product))
		  end	
    end
  end
end    