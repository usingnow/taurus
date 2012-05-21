module Taurus
	module Index
		class HomeController < BaseController
			def index
				@products = Product.selling
      end
		end
	end	
end