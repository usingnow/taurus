module Taurus
	module Index
		class HomeController < Taurus::Index::BaseController
			def index
				@search = Product.search(params[:q])
				@products = Product.shown.displays
				@slider_bars = SliderBar.display
      end
		end
	end	
end