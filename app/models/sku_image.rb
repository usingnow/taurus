class SkuImage < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/assets/sku_images/:basename.:extension",
                    :path => ":rails_root/public/assets/sku_images/:basename.:extension"

  validates :name ,:presence => true
end
