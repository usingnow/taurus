module Taurus
	module Admin
		class CustomPropertyValuesController < BaseController
			helper "taurus/custom_property_values"
			
			def index
		    @product = Product.find(params[:product_id])
		  end

      def show
        @product = Product.find(params[:product_id])
      end

      def new
        @product = Product.find(params[:product_id])
      end

      def create
        @product = Product.find(params[:product_id])

        @product.custom_property_values.destroy_all
        
        params[:string_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(:custom_property_id => key, :string_value => value)
        end if params[:string_value]

        params[:custom_property_value][:string_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(
            :custom_property_id => key, 
            :string_value => value[:'(1i)'].rjust(2,"0")+"-"+value[:'(2i)'].rjust(2,"0")+"-"+value[:'(3i)'].rjust(2,"0")
          )
        end if params[:custom_property_value]

        params[:text_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(:custom_property_id => key, :text_value => value)
        end if params[:text_value]

        if @product.save
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to(new_admin_product_product_image_url(@product)) 
        else
          render :action => :index
        end
      end

		  def update
				@product = Product.find(params[:product_id])

				@product.custom_property_values.destroy_all
        
        params[:string_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(:custom_property_id => key, :string_value => value)
        end if params[:string_value]

        params[:custom_property_value][:string_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(
          	:custom_property_id => key, 
          	:string_value => value[:'(1i)'].rjust(2,"0")+"-"+value[:'(2i)'].rjust(2,"0")+"-"+value[:'(3i)'].rjust(2,"0")
          )
        end if params[:custom_property_value]

        params[:text_value].each do |key,value|
          @product.custom_property_values << CustomPropertyValue.new(:custom_property_id => key, :text_value => value)
        end if params[:text_value]

        if @product.save
          flash[:success] = I18n.t(:successfully_updated)
          redirect_to(admin_product_custom_property_values_url(@product)) 
        else
          render :action => :index
        end
		  end
    end
  end
end    