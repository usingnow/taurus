module Taurus
	module Admin
		class ProductCategoriesController < BaseController
			def index
        @search = ProductCategory.search(params[:q])
        @product_categories = @search.result.paginate(:page => params[:page], :per_page => 20)
			end

			def show
			  @product_category = ProductCategory.find(params[:id])
			end

			def new 
				@product_category = ProductCategory.new
			end

			def create
				@product_category = ProductCategory.new(params[:product_category])

				if @product_category.save
					redirect_to(admin_product_categories_url)
				else
					render :action => "new"
				end
			end

			def edit
			  @product_category = ProductCategory.find(params[:id])
			end

			def update
			  @product_category = ProductCategory.find(params[:id])

				if @product_category.update_attributes(params[:product_category])
					redirect_to(admin_product_categories_url)
				else
					render :action => "edit"
				end		
			end
			
			def destroy
				@product_category = ProductCategory.find(params[:id])
				@product_category.destroy
			  redirect_to(admin_product_categories_url)
			end  
		end
	end
end