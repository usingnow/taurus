module Taurus
	module Admin
		class BrandsController < BaseController
			def index
		    @search = Brand.search(params[:q])
		    @brands = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def show
		    @brand = Brand.find(params[:id])
		  end

		  def new
		    @brand = Brand.new
		  end

		  def edit
		    @brand = Brand.find(params[:id])
		  end

		  def create
				@brand            = Brand.new(params[:brand])
				@brand.created_by = current_administrator.id
				@brand.updated_by = current_administrator.id

		    if @brand.save
		    	redirect_to admin_brands_url
		    else
		    	render :action => "new"
		    end	
		  end

		  def update
				@brand            = Brand.find(params[:id])
				@brand.updated_by = current_administrator.id

		    if @brand.update_attributes(params[:brand])
		    	redirect_to admin_brands_url
		    else
		    	render :action => "new"
		    end
		  end

		  def destroy
		    @brand = Brand.find(params[:id])
		    @brand.destroy

		    redirect_to admin_brands_url
		  end 
    end
  end
end    