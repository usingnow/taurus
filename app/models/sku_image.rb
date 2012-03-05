class SkuImage < ActiveRecord::Base
  belongs_to :sku
  has_attached_file :image,
                    :url  => lambda { |l| "/paperclip_assets/sku_images/#{l.instance.sku.number}/:id/:style_:id.:extension" },
                    :path => lambda { |l| "#{Rails.root}/public/paperclip_assets/sku_images/#{l.instance.sku.number}/:id/:style_:id.:extension" },
                    :styles => { :normal => "800x800#", :s400 => "400x400#", :s120 => "120x120#", :s50 => "50x50#" }

  validates :name ,:presence => true
end
