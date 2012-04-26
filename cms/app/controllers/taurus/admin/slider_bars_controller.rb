module Taurus
  module Admin
    class SliderBarsController < BaseController
      before_filter :authenticate_administrator!
      #authorize_resource

      def index
        @slider_bars = Taurus::SliderBar.all
      end

      def show
        @slider_bar = Taurus::SliderBar.find(params[:id])

      end

      def new
        @slider_bar = Taurus::SliderBar.new
      end

      def edit
        @slider_bar = Taurus::SliderBar.find(params[:id])
      end

      def create
        @slider_bar = Taurus::SliderBar.new(params[:slider_bar])

        if @slider_bar.save
          redirect_to admin_slider_bars_url
        else
          render "new"
        end
      end


      def update
        @slider_bar = Taurus::SliderBar.find(params[:id])

        if @slider_bar.update_attributes(params[:slider_bar])
          redirect_to content_slider_bars_url
        else
          render "edit"
        end
      end


      def destroy
        @slider_bar = Taurus::SliderBar.find(params[:id])
        @slider_bar.destroy
        redirect_to admin_slider_bars_url
      end
    end
  end
end
