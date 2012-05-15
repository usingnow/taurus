module Taurus
	module Admin
		class FunctionsController < BaseController
      def index
        com = Function.component(params[:id])
        session[:component] = com
        redirect_to(com["functions"].first["url"])
      end

			def show
        com = Function.component(params[:id])
        redirect_to(com["functions"].first["url"], :notice => com)
			end
		end
  end
end