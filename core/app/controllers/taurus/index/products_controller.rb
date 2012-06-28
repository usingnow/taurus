module Taurus
  module Index
    class ProductsController < Taurus::Index::BaseController
    	helper "taurus/custom_property_values"
    	helper "taurus/products"

      def show
        @product = Product.find(params[:id])
      end
      
    end
  end
end