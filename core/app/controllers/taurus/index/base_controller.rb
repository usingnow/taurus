#encoding:UTF-8
module Taurus
	module Index
		class BaseController < Taurus::BaseController
			layout "/taurus/layouts/index"
      
      # 当前购物车
	    def current_cart
	      Cart.find(cookies[:cart_id])
	    rescue ActiveRecord::RecordNotFound
	      cart =  Cart.create
	      cookies[:cart_id] = cart.id
	      cart
	    end

      # 重写devise 登录认证
	    def authenticate_user!
        redirect_to(new_user_session_path, :alert => I18n.t("devise.failure.unauthenticated")) unless current_user
	    end

		end
	end
end