module Taurus
	module Admin
		class BrandsController < BaseController
			def index
				params[:q] = { :status_eq => true } unless params[:q]
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
		    	flash[:success] = I18n.t('successfully_created')  
		    	redirect_to admin_brand_url(@brand)
		    else
		    	render :action => "new"
		    end	
		  end

		  def update
				@brand            = Brand.find(params[:id])
				@brand.updated_by = current_administrator.id

		    if @brand.update_attributes(params[:brand])
		    	flash[:success] = I18n.t('successfully_updated') 
		    	redirect_to admin_brand_url(@brand)
		    else
		    	render :action => "edit"
		    end
		  end

		  def destroy
		    @brand = Brand.find(params[:id])
		    if @brand.destroy
		    	flash[:success] = I18n.t('successfully_destroyed')
		    else
		    	flash[:error] = I18n.t(:failure_destroyed)
        end
		    redirect_to admin_brands_url
		  end 
    end
  end
end    