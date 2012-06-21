module Taurus
	module ProductImagesHelper
    def set_up_main_img_btn(product_image)
    	html_class = "btn btn-success"

      if product_image.is_main
      	name = t('admin.misc.product_image.main_img')
      	href = "#"
      	html_class << " disabled"
      else
        name = t('admin.misc.product_image.set_up_main_img')
      	href = set_up_main_img_admin_product_product_image_path(@product, product_image)
      end	

      link_to name,  href, :method => :put, :class => html_class
    end
	end
end