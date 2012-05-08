module Taurus
	module Admin
	  class CompanyScalesController < BaseController
	  	def index
				@search     = CompanyScale.search(params[:q])
				@company_scales = @search.result.paginate(:page => params[:page], :per_page => 20)
	  	end

	  	def new
	  		@company_scale = CompanyScale.new
	  	end

	  	def create
	  		@company_scale = CompanyScale.new params[:company_scale]
	  		if @company_scale.save
	  			redirect_to(admin_company_scales_url)
	  	  else
	  	  	render "new"
	  	  end
	  	end

	  	def edit 
	  		@company_scale = CompanyScale.find(params[:id])
	  	end

	  	def update
	  		@company_scale = CompanyScale.find(params[:id])
	  		if @company_scale.update_attributes(params[:company_scale])
	  		  redirect_to(admin_company_scales_url)
	  		else
	  		  render "edit"
	  		end
	    end
	    
	  end
	end
end