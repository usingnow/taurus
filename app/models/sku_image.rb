class SkuImage < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/paperclip_assets/sku_images/:basename.:extension",
                    :path => ":rails_root/public/paperclip_assets/sku_images/:basename.:extension"

  validates :name ,:presence => true
end
