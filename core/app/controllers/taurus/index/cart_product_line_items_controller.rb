module Taurus
	module Index
		class CartProductLineItemsController < BaseController
			def index
				@cart = current_cart
      end

      def create
      	@cart = current_cart
      	@cart_product_line_item = @cart.add_product(params[:product_id])
      	@cart_product_line_item.save
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