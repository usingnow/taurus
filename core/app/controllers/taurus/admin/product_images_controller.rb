module Taurus
  module Admin
    class ProductImagesController < BaseController
      helper "taurus/product_images"

      def index
        @product = Product.find(params[:product_id])
        @product_image = ProductImage.new
      end

      def show
        @product = Product.find(params[:product_id])
      end

      def create
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.build(params[:product_image])

        if @product_image.save
          flash[:success] = I18n.t(:successfully_created)
          redirect_to admin_product_product_images_url(@product)
        else
          @product = Product.find(params[:product_id])
          render :action => :index
        end
      end

      def edit
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        render :action => :index
      end

      def update
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        if @product_image.update_attributes(params[:product_image])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to admin_product_product_images_url(@product)
        else
          render :action => :index
        end
      end


      def destroy
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        if @product_image.destroy
          flash[:success] = I18n.t(:successfully_destroyed)
        else
          flash[:error] = I18n.t(:failure_destroyed)
        end 

        redirect_to(admin_product_product_images_url(@product)) 
      end

      def set_up_main_img
        @product = Product.find(params[:product_id])
        @product_image = @product.product_images.find(params[:id])

        if @product_image.update_attributes(:is_main => true)
          flash[:success] = I18n.t(:successfully_updated)
        end

        redirect_to(admin_product_product_images_url(@product))   
      end
    end
  end
end    
