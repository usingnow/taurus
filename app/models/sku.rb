class Sku < ActiveRecord::Base
  has_many :sku_images
  belongs_to :brand
  has_many :sku_productships
  has_many :products, :through => :sku_productships
  belongs_to :sku_category

  scope :recommendation, where("number in('801800','801810','805457','805488')")
  scope :oa_pc_skus, limit(8).where("sku_category_id in(select id from sku_categories where root_id = 1769)
                            and status = 1 and sales_status = 1")
  scope :oa_pc_hots, limit(6).order("total_sale desc").where("sku_category_id in(select id from sku_categories where root_id = 1769)
                                     and status = 1 and sales_status = 1")
  scope :office_skus, limit(8).where("sku_category_id in(select id from sku_categories where root_id = 2265)
                            and status = 1 and sales_status = 1")
  scope :office_hots, limit(6).order("total_sale desc").where("sku_category_id in(select id from sku_categories where root_id = 2265)
                                     and status = 1 and sales_status = 1")
  scope :daily_skus, limit(8).where("sku_category_id in(select id from sku_categories where root_id = 2837)
                            and status = 1 and sales_status = 1")
  scope :daily_hots, limit(6).order("total_sale desc").where("sku_category_id in(select id from sku_categories where root_id = 2837)
                                     and status = 1 and sales_status = 1")

  validates :number, :name, :brand_id, :brand_name, :sku_category_id, :sku_category_name, :unit, :specification,
            :delivery_day, :sku_type,  :presence => true
  validates_uniqueness_of :number


end
