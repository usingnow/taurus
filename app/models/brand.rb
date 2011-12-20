class Brand < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/assets/brands/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/brands/:id/:style_:basename.:extension"
  validates :chinese_name, :company_name, :presence => true
end
