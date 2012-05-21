#encoding:UTF-8
module Taurus
  class ProductImage < ActiveRecord::Base
  	has_attached_file :image,
	                    :url  => "/taurus/product_images/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/product_images/:id/:style/:basename.:extension",
	                    :styles => { :normal => "800x800#", :s400 => "400x400#", :s120 => "120x120#", :s50 => "50x50#" }
	
    belongs_to :product
    before_save :check_is_main


    protected
    #同一商品只能有一个主图片
    def check_is_main
      product_image = ProductImage.find_by_product_id_and_is_main(product_id,true)
      if product_image
        product_image.update_attribute(:is_main,false) if is_main
      else
      	self.is_main = true 
      end
    end
	end
end