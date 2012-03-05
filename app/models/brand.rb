class Brand < ActiveRecord::Base
  has_many :skus
  has_attached_file :image,
                    :url  => "/paperclip_assets/brands/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/paperclip_assets/brands/:id/:style_:basename.:extension"

  validates :chinese_name, :company_name, :presence => true


  def skus
    Sku.where("brand_id = #{id} and status = 1 and id in(select sku_id from sku_on_shelves where status = 1)")
  end
end
