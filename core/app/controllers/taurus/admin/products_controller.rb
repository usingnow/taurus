module Taurus
	module Admin
		class ProductsController < BaseController
			autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory"

			def index
				params[:q] = { :sales_status_eq => true, :if_shown_on_web_eq => true } unless params[:q]
		    @search = Product.single.search(params[:q])
		    @products = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

		  def show
		    @product = Product.find(params[:id])
		  end

		  def show_sales_status
        @product = Product.find(params[:id])
		  end

		  def new
		    @product = Product.new
		  end

		  def edit
		    @product = Product.find(params[:id])
		  end

		  def create
				@product = Product.new params[:product]

		    if @product.save
		    	flash[:success] = I18n.t('admin.misc.product.successfully_created')
		    	redirect_to edit_admin_product_url(@product)
		    else
		    	render :action => "new"
		    end	
		  end

		  def update
				@product = Product.find(params[:id])

		    if @product.update_attributes(params[:product])
		    	flash[:success] = I18n.t(:successfully_updated)
		    	redirect_to edit_admin_product_url(@product)
		    else
		    	render :action => "edit"
		    end
		  end

		  def edit_sales_status
        @product = Product.find(params[:id])
		  end

		  def update_sales_status
				@product = Product.find(params[:id])
				@product.current_step = "sales_status"

		    if @product.update_attributes(params[:product])
		    	flash[:success] = I18n.t(:successfully_updated)
		    	redirect_to edit_sales_status_admin_product_url(@product)
		    else
		    	render :action => "edit_sales_status"
		    end
		  end

		  def combined
        params[:q] = { :sales_status_eq => true, :if_shown_on_web_eq => true } unless params[:q]
		    @search = Product.combined.search(params[:q])
		    @products = @search.result.paginate(:page => params[:page], :per_page => 20)
		  end

    end
  end
end    