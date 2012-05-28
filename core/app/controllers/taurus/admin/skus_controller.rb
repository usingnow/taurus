module Taurus
	module Admin
		class SkusController < BaseController
			autocomplete :product_category, :name, :class_name => "Taurus::ProductCategory"
			autocomplete :brand, :chinese_name, :class_name => "Taurus::Brand"
			autocomplete :supplier, :name, :class_name => "Taurus::Supplier"

			def index
				@search = Sku.search(params[:q])
				@skus = @search.result.paginate(:page => params[:page], :per_page => 20)
			end

			def show
        @sku = Sku.find(params[:id])
			end

			def new
				@sku = Sku.new
			end

			def create
				@sku = Sku.new params[:sku]

				if @sku.save
				  redirect_to(admin_skus_url)
				else
				  render :action => "new"
				end
			end

			def edit
        @sku = Sku.find(params[:id])
			end

			def update
        @sku = Sku.find(params[:id])

        if @sku.update_attributes(params[:sku])
				  redirect_to(admin_skus_url)
				else
				  render :action => "edit"
				end
			end

			def clone
        templete = Sku.find(params[:id])
        
        @sku = Sku.new(templete.attributes)

        render :action => "new"
			end

		end
	end
end