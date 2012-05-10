module Taurus
	module Admin
		class UsersController < BaseController

		  def index
		    @users = User.all

		    respond_to do |format|
		      format.html # index.html.erb
		      format.xml  { render :xml => @users }
		    end
		  end
		end
  end
end		
