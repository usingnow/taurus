module Taurus
  module Admin
  	class BaseController < Taurus::BaseController
  		before_filter do 
		    redirect_to :administrator_session unless current_administrator
		  end
  		layout '/taurus/layouts/admin'
  	end
  end
end