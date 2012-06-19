#encoding:UTF-8
module Taurus
  class ProductImage < ActiveRecord::Base
  	has_attached_file :image,
	                    :url  => "/taurus/product_images/:id/:style/:basename.:extension",
	                    :path => ":rails_root/public/taurus/product_images/:id/:style/:basename.:extension",
	                    :styles => { :large => "1040x720#", :normal => "520x360#", :small => "260x180#", :logo => "65x45#" }
	
    belongs_to :product
    
    before_save :check_is_main

    validates_presence_of :image_file_name
    validates_attachment_presence :image
    
    scope :main, where(:is_main => true)

    protected
    # 同一商品只能有一个主图片
    def check_is_main
      if is_main
        product.product_images.update_all(:is_main => false)
        self.is_main = true
      else
        self.is_main = true if product.product_images.find_by_is_main(true)
      end
    end
	end
end