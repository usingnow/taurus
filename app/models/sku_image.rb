class SkuImage < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/assets/sku_images/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/sku_images/:id/:style_:basename.:extension"

  validates :name ,:presence => true
end
