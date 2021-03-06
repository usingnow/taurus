#encoding:UTF-8
module Taurus
  module Admin
    class ProductDisplaysController < BaseController
      autocomplete :product, :name, :class_name => "Taurus::Product"

      def index
        @search = ProductDisplay.search(params[:q])
        @product_displays = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @product_display = ProductDisplay.find(params[:id])
      end

      def new
        @product_display = ProductDisplay.new
      end

      def create
        @product_display = ProductDisplay.new(params[:product_display])

        if @product_display.save
          redirect_to(admin_product_display_url(@product_display), :notice => t('successfully_created'))
        else
          render :action => :new
        end
      end

      def edit
        @product_display = ProductDisplay.find(params[:id])
      end

      def update
        @product_display = ProductDisplay.find(params[:id])

        if @product_display.update_attributes(params[:product_display])
          redirect_to(admin_product_display_url(@product_display), :notice => t('successfully_updated'))
        else
          render :action => :edit
        end
      end

      def destroy
        @product_display = ProductDisplay.find(params[:id])

        if @product_display.destroy
          flash[:success] = t('successfully_destroyed')
        else
          flash[:alert] = t('failure_destroyed')
        end

        redirect_to(admin_product_displays_url)
      end
    end
  end
end
