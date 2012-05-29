module Taurus
	module Index
		class HomeController < BaseController
			def index
				@search = Product.search(params[:q])
				@products = @search.result.selling
				@slider_bars = SliderBar.display
      end
		end
	end	
end