module Taurus
  module Admin
    class ProductImagesController < BaseController

      def index
        @product = Product.find(params[:product_id])
        @product_image = ProductImage.new
      end

      def show
        @product = Product.find(params[:product_id])
      end

      def create
        @product = Product.find(params[:product_id])
        @product.product_images.build(params[:product_image])

        if @product.save
          redirect_to admin_product_product_images_url(@product)
        else
          render :action => "index"
        end
      end

      def edit
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        render :action => "index"
      end

      def update
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        if @product_image.update_attributes(params[:product_image])
          redirect_to admin_product_product_images_url(@product)
        else
          render :action => "index"
        end
      end


      def destroy
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        @product_image.destroy

        redirect_to(admin_product_product_images_url(@product)) 
      end
    end
  end
end    
