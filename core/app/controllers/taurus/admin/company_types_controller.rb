module Taurus
	module Admin
	  class CompanyTypesController < BaseController
	  	def index
				@search = CompanyType.search(params[:q])
				@company_types = @search.result.paginate(:page => params[:page], :per_page => 20)
	  	end

	  	def new
	  		@company_type = CompanyType.new
	  	end

	  	def create
	  		@company_type = CompanyType.new params[:company_type]
	  		if @company_type.save
	  			flash[:success] = I18n.t('successfully_created')
	  			redirect_to(admin_company_types_url)
	  	  else
	  	  	render "new"
	  	  end
	  	end

	  	def edit 
	  		@company_type = CompanyType.find(params[:id])
	  	end

	  	def update
	  		@company_type = CompanyType.find(params[:id])
	  		if @company_type.update_attributes(params[:company_type])
	  			flash[:success] = I18n.t('successfully_updated')
	  		  redirect_to(admin_company_types_url)
	  		else
	  		  render "edit"
	  		end
	    end
	    
	  end
	end
end