module Taurus
	module Admin
		class CustomPropertiesController < BaseController
			helper "taurus/custom_properties"
			helper "taurus/product_categories"
			
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

	    	@custom_property = CustomProperty.new(params[:custom_property])
	    	@custom_property.product_category_id = @product_category.id

	    	if @custom_property.save
	    		flash[:success] = I18n.t(:successfully_created)
	    		redirect_to(new_admin_product_category_custom_property_path(@product_category))
	    	else
	    		render :action => :new
	    	end
	    end	

	    def edit
	    	@product_category = ProductCategory.find(params[:product_category_id])
	    	@custom_property = CustomProperty.find(params[:id])

	    	render :action => :new
	    end

	    def update
	    	@product_category = ProductCategory.find(params[:product_category_id])
	    	@custom_property = CustomProperty.find(params[:id])
	    	
	    	if @custom_property.update_attributes(params[:custom_property])
	    		flash[:success] = I18n.t(:successfully_updated)
	    		redirect_to(new_admin_product_category_custom_property_path(@product_category))
	    	else
	    		render :action => :new
	    	end
	    end

	    def destroy
        @product_category = ProductCategory.find(params[:product_category_id])
        @custom_property = CustomProperty.find(params[:id])

	    	if @custom_property.destroy
					flash[:success] = I18n.t(:successfully_destroyed)
				else
          flash[:error] = I18n.t(:failure_destroyed, :models=> destroy_error_models(@custom_property))
				end

	    	redirect_to(new_admin_product_category_custom_property_path(@product_category))
	    end
		end
	end
end