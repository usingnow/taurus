#encoding:UTF-8
module Taurus
	module Admin
		class ProductCategoriesController < BaseController
			helper "taurus/product_categories"
			autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory"

			def index
				params[:q] = { :status_eq => true } unless params[:q]
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
					flash[:success] = I18n.t('successfully_created')
					redirect_to(admin_product_category_url(@product_category))
				else
					render :action => "new"
				end
			end

			def edit
			  @product_category = ProductCategory.find(params[:id])
			  @product_category.parent_name = @product_category.parent.name if @product_category.parent
			end

			def update
			  @product_category = ProductCategory.find(params[:id])

				if @product_category.update_attributes(params[:product_category])
					flash[:success] = I18n.t('successfully_updated')
					redirect_to(admin_product_category_url(@product_category))
				else
					render :action => "edit"
				end		
			end
			
			def destroy
				@product_category = ProductCategory.find(params[:id])
				if @product_category.destroy
					flash[:success] = I18n.t(:successfully_destroyed)
				else
          flash[:error] = I18n.t(:failure_destroyed, :models=> destroy_error_models(@product_category))
				end
			  redirect_to(:back)
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