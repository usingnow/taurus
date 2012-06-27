module Taurus
	module Index
		class CartProductLineItemsController < Taurus::Index::BaseController
			def index
				@cart = current_cart

        respond_to do |format|
          format.html
          format.json { render :json => @cart.to_json(:methods => :total_amount) }
        end
      end

      def create
      	@cart = current_cart
        
        @product = Product.available.find_by_id(params[:product_id])

        if @product
        	@cart_product_line_item = @cart.add_product(@product.id)
        	@cart_product_line_item.save
        end
          
        redirect_to(index_cart_product_line_items_url)
      end

      def destroy
      	@cart = current_cart
        @cart_product_line_item = @cart.cart_product_line_items.find(params[:id])
        @cart_product_line_item.destroy
        redirect_to(index_cart_product_line_items_url)
      end	

      def update
        @cart = current_cart 

        params[:product_amount].each do |key,value|
          @cart_product_line_item = @cart.cart_product_line_items.find(key.to_i)

          @cart_product_line_item.update_attributes(
          	:product_amount => value.to_i
          ) unless @cart_product_line_item.product_amount == value.to_i 

        end if params[:product_amount]

        redirect_to(index_cart_product_line_items_url)
      end

		end
	end	
end