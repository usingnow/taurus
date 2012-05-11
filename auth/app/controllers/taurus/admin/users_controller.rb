module Taurus
	module Admin
		class UsersController < BaseController

		  def index
		    @users = User.all
		  end
		end
  end
end		
