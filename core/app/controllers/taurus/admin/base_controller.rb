module Taurus
  module Admin
  	class BaseController < Taurus::BaseController
      # 判断是否登录
  		before_filter do 
		    redirect_to :administrator_session unless current_administrator
		  end
      
      # 获取I18n locale
		  before_filter do
		  	I18n.locale = current_administrator.language || I18n.default_locale
		  end

  		layout '/taurus/layouts/admin'
  	end
  end
end