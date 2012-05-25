module Taurus
	module Admin
		class AlipaysController < BaseController
      def index
        @alipay = Alipay.first
        @alipay = Alipay.create unless @alipay
      end

      def update
        @alipay = Alipay.first

        if @alipay.update_attributes(params[:alipay])
          redirect_to(admin_alipays_url, :notice => I18n.t(:successfully_updated))
        else
          render :action => :index
        end
      end
		end
  end
end