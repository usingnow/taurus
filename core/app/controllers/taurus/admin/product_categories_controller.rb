#encoding:UTF-8
module Taurus
  module Admin
    class ProductCategoriesController < BaseController
      helper "taurus/product_categories"
      autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory", :scopes => [:single]
      autocomplete :combined_category, :name, :class_name => "Taurus::ProductCategory", :scopes => [:combined]

      def index
        params_q = params[:q] || {}

        params_q.deep_merge!(:status_eq => true) unless params_q[:status_eq]
        params_q.deep_merge!(:category_type_eq => 0) unless params_q[:category_type_eq]

        @search = ProductCategory.tops.search(params_q)
        @product_categories = @search.result.paginate(:page => params[:page], :per_page => 20)
      end

      def show
        @product_category = ProductCategory.find(params[:id])
        @product_category.parent_name = @product_category.parent.name if @product_category.parent
      end

      def new 
        @product_category = ProductCategory.new(:status => true)
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

      def children
        @product_category = ProductCategory.find(params[:id]) 
      end  

      def edit_children
        @product_category = ProductCategory.find(params[:id]) 
        @child_category = ProductCategory.new
        @child_category.parent_id = @product_category.id
        @child_category.parent_name = @product_category.name
      end

      def create_child
        @product_category = ProductCategory.find(params[:id])
        @child_category = ProductCategory.new(params[:product_category])
        @child_category.parent_id = @product_category.id 
        @child_category.parent_name = @product_category.name
        @child_category.category_type = @product_category.category_type

        if @child_category.save
          flash[:success] = I18n.t(:successfully_created)
          redirect_to(edit_children_admin_product_category_path(@product_category))
        else
          render :action => :edit_children
        end
      end

      def edit_child
        @child_category = ProductCategory.find(params[:id])

        @product_category = @child_category.parent

        @child_category.parent_id = @product_category.id
        @child_category.parent_name = @product_category.name

        render :action => :edit_children
      end

      def update_child
        @child_category = ProductCategory.find(params[:id])
        @product_category = @child_category.parent
        @child_category.parent_name = @product_category.name

        if @child_category.update_attributes(params[:product_category])
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to(edit_children_admin_product_category_path(@product_category))
        else
          @child_category.parent_name = @product_category.name
          render :action => :edit_children
        end
      end

      def destroy_child
        @child_category = ProductCategory.find(params[:id])
        @product_category = @child_category.parent

        if @child_category.destroy
          flash[:success] = I18n.t(:successfully_destroyed)
        else
          flash[:error] = I18n.t(:failure_destroyed)
        end

        redirect_to(edit_children_admin_product_category_path(@product_category))
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


      def combined_new
        @product_category = ProductCategory.new(:category_type => 1, :status => true)
        
        if params[:parent_id]
          @parent = ProductCategory.find(params[:parent_id])
          @product_category.parent_id = @parent.id
          @product_category.parent_name = @parent.name
        else
          @product_category.parent_name = "无"
        end
      end

      def combined_create
        @product_category = ProductCategory.new(params[:product_category])
        @product_category.category_type = 1

        if @product_category.save
          flash[:success] = I18n.t('successfully_created')
          redirect_to(admin_product_category_url(@product_category))
        else
          render :action => :combined_new
        end
      end
    end
  end
end