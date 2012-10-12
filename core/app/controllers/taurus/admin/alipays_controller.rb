module Taurus
	module Admin
		class AlipaysController < BaseController
      def index
        @alipay = Alipay.first || Alipay.create
      end

      def update
        @alipay = Alipay.first

        if @alipay.update_attributes(params[:alipay])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to(admin_alipays_url)
        else
          render :action => :index
        end
      end
		end
  end
end