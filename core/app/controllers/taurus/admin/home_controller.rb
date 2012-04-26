module Taurus
	module Admin
		class HomeController < BaseController
		  before_filter :authenticate_administrator!
		  

		  def index

		  end
		end
	end	
end		
