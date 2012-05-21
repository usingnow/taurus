#encoding:UTF-8
module Taurus
	module Index
		class BaseController < Taurus::BaseController
			layout "/taurus/layouts/index"
      
      #当前购物车
	    def current_cart
	      Cart.find(cookies[:cart_id])
	    rescue ActiveRecord::RecordNotFound
	      cart =  Cart.create
	      cookies[:cart_id] = cart.id
	      cart
	    end

		end
	end
end