module Taurus
  module Admin
    class SliderBarsController < BaseController
      def index
        @slider_bars = SliderBar.all
      end

      def show
        @slider_bar = SliderBar.find(params[:id])
      end

      def new
        @slider_bar = SliderBar.new
      end

      def create
        @slider_bar = SliderBar.new(params[:slider_bar])

        if @slider_bar.save
          redirect_to admin_slider_bar_url(@slider_bar), :notice => I18n.t(:successfully_created)
        else
          render "new"
        end
      end
      
      def edit
        @slider_bar = SliderBar.find(params[:id])
      end

      def update
        @slider_bar = SliderBar.find(params[:id])

        if @slider_bar.update_attributes(params[:slider_bar])
          redirect_to admin_slider_bar_url(@slider_bar), :notice => I18n.t(:successfully_updated)
        else
          render "edit"
        end
      end


      def destroy
        @slider_bar = SliderBar.find(params[:id])
        if @slider_bar.destroy
          flash[:notice] = I18n.t(:successfully_destroyed)
        else
          flash[:error] = I18n.t(:failure_destroyed)
        end
        redirect_to admin_slider_bars_url
      end
    end
  end
end
