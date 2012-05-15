module Taurus
	module Admin
		class HomeController < BaseController
		  def index
        session[:component] = Function.component("09")
		  end
		end
	end	
end		
