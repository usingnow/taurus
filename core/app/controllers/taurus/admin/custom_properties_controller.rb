module Taurus
	module Admin
		class CustomPropertiesController < BaseController
			helper "taurus/custom_properties"
	    def index
	    	@product_category = ProductCategory.find(params[:product_category_id])
        @search = @product_category.custom_properties.search(params[:q])
        @custom_properties = @search.result.paginate(:page => params[:page], :per_page => 20)
	    end

	    def show
        @custom_property = CustomProperty.find(params[:id])
	    end

	    def new
	    	@product_category = ProductCategory.find(params[:product_category_id])
	    	@custom_property = CustomProperty.new
	    end
	    
	    def create
        @product_category = ProductCategory.find(params[:product_category_id])
	    	@custom_property = @product_category.custom_properties.build(params[:custom_property])
	    	if @custom_property.save
	    		redirect_to(admin_product_category_custom_properties_path(@product_category))
	    	else
	    		render :action => "new"
	    	end
	    end	

	    def edit
	    	@product_category = ProductCategory.find(params[:product_category_id])
	    	@custom_property = CustomProperty.find(params[:id])
	    end

	    def update
	    	@custom_property = CustomProperty.find(params[:id])
	    	if @custom_property.update_attributes(params[:custom_property])
	    		redirect_to(admin_product_category_custom_properties_path(@custom_property.product_category_id))
	    	else
	    		render :action => "edit"
	    	end
	    end
		end
	end
end