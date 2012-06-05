#encoding:UTF-8
module Taurus
	module Admin
		class ProductCategoriesController < BaseController
			helper "taurus/product_categories"

			def index
        @search = ProductCategory.search(params[:q])
        @product_categories = @search.result.paginate(:page => params[:page], :per_page => 20)
			end

			def show
			  @product_category = ProductCategory.find(params[:id])
			end

			def new 
				@product_category = ProductCategory.new
				if params[:parent_id]
					@parent = ProductCategory.find(params[:parent_id])
					@product_category.parent_id = @parent.id
					@product_category.parent_name = @parent.name
				else
					@product_category.parent_name = "无"
				end	
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
				if @product_category.destroy
					flash[:success] = I18n.t(:successfully_destroyed)
				else
          flash[:error] = I18n.t(:failure_destroyed)
				end
			  redirect_to(admin_product_categories_url)
			end  
      
      #第二级分类
			def seconds
				@product_category = ProductCategory.find(params[:id])
				params[:q] = { :parent_id_eq => params[:id]}
				index
				render :action => "index"
			end

      #第三级分类
			def thirds
        @product_category = ProductCategory.find(params[:id]).parent
        @second_category_id = params[:id]
				params[:q] = { :parent_id_eq => params[:id]}
				index
				render :action => "index"
			end
		end
	end
end