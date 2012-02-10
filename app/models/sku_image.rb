class SkuImage < ActiveRecord::Base
  belongs_to :sku

  has_attached_file :image,
                    :url  => lambda{ |l| "/paperclip_assets/sku_images/#{l.instance.sku.number}-:id.:extension" },
                    :path => lambda{ |l| "#{Rails.root}/public/paperclip_assets/sku_images/#{l.instance.sku.number}-:id.:extension" }

  validates :name ,:presence => true
end
