module Taurus
	module Admin
		class ProductsController < BaseController
			autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory", :scopes => [:single, :actived]
      autocomplete :combined_category, :name, :class_name => "Taurus::ProductCategory", :scopes => [:combined, :actived]

			def index
				params[:q] = { :sales_status_eq => true, :if_shown_on_web_eq => true, :product_type_eq => 0 } unless params[:q]
		    @search = Product.search(params[:q])
		    @products = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def show
		    @product = Product.find(params[:id])
		  end

		  def show_sales_status
        @product = Product.find(params[:id])
		  end

		  def new
		    @product = Product.find_by_id(params[:product_id]) || Product.new
		  end

		  def edit
		    @product = Product.find(params[:id])
		  end

		  def create
				@product = Product.new params[:product]

		    if @product.save
		    	flash[:success] = I18n.t('admin.misc.product.successfully_created')
		    	redirect_to new_admin_product_custom_property_value_url(@product)
		    else
		    	render :action => "new"
		    end	
		  end

		  def update
				@product = Product.find(params[:id])

		    if @product.update_attributes(params[:product])
		    	flash[:success] = I18n.t(:successfully_updated)
		    	redirect_to params[:from_view] ? new_admin_product_custom_property_value_url(@product) : edit_admin_product_url(@product)
		    else
		    	render :action => params[:from_view] ? :new : :edit
		    end
		  end

		  def new_sales_status
        @product = Product.find(params[:id])
		  end

		  def edit_sales_status
        @product = Product.find(params[:id])
		  end

		  def update_sales_status
				@product = Product.find(params[:id])
				@product.current_step = "sales_status"

		    if @product.update_attributes(params[:product])
		    	flash[:success] = I18n.t(:successfully_updated)
		    	redirect_to params[:from_view] ? admin_product_path(@product) : edit_sales_status_admin_product_url(@product)
		    else
		    	render :action => params[:from_view] ? :new_sales_status : :edit_sales_status
		    end
		  end

		  def combined_new
        @product = Product.find_by_id(params[:product_id]) || Product.new
		  end

		  def combined_create
				@product = Product.new params[:product]
        @product.product_type = 1				

		    if @product.save
		    	flash[:success] = I18n.t('admin.misc.product.successfully_created')
		    	redirect_to new_admin_product_custom_property_value_url(@product)
		    else
		    	render :action => :combined_new
		    end	
		  end

    end
  end
end    