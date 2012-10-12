#encoding:UTF-8
module Taurus
  module Admin
    class ShippingCostsController < BaseController

      def index
        @shipping_cost = ShippingCost.first || ShippingCost.create
      end
      
      def update
        @shipping_cost = ShippingCost.first

        if @shipping_cost.update_attributes(params[:shipping_cost])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to(admin_shipping_costs_url)
        else
          render :action => :index
        end
      end
    end
  end
end