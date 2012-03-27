#encoding:UTF-8
class Brand < ActiveRecord::Base
  has_many :skus
  has_attached_file :image,
                    :url  => "/paperclip_assets/brands/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/paperclip_assets/brands/:id/:style_:basename.:extension"

  ACTIVE = { 0 => "关闭", 1 => "激活" }

  validates :chinese_name, :company_name, :presence => true


  def skus
    Sku.where("brand_id = #{id} and id in(select sku_id from sku_on_shelves where status = 1)")
  end
end
