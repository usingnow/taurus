module Taurus
	module Admin
	  class IndustriesController < BaseController
	  	def index
				@search     = Industry.search(params[:q])
				@industries = @search.result.paginate(:page => params[:page], :per_page => 20)
	  	end

	  	def new
	  		@industry = Industry.new
	  	end

	  	def create
	  		@industry = Industry.new params[:industry]
	  		if @industry.save
	  			redirect_to(admin_industries_url)
	  	  else
	  	  	render "new"
	  	  end
	  	end

	  	def edit 
	  		@industry = Industry.find(params[:id])
	  	end

	  	def update
	  		@industry = Industry.find(params[:id])
	  		if @industry.update_attributes(params[:industry])
	  		  redirect_to(admin_industries_url)
	  		else
	  		  render "edit"
	  		end
	    end
	    
	  end
	end
end