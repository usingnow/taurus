#encoding:UTF-8
class Sku < ActiveRecord::Base
  has_many :sku_images
  belongs_to :brand
  has_many :sku_productships
  has_many :products, :through => :sku_productships
  belongs_to :sku_category
  has_many :sku_on_shelves
  has_many :sku_browsing_histories

  attr_accessor :brand_name, :sku_category_name, :sku_category_number

  validates :number, :name, :brand_id, :brand_name, :sku_category_id, :sku_category_name, :unit, :specification,
            :delivery_day, :sku_type,  :presence => true
  validates_uniqueness_of :number

  scope :recommendation, where("number in('801800','801810','805457','805488')")

  def self.category_skus(number)
    limit(8).where("sku_category_id in(select id from sku_categories where number like '#{number}%')
      and status = 1 and id in(select sku_id from sku_on_shelves where status = 1)")
  end

  def self.category_hots(number)
    limit(6).order("total_sale desc").where("sku_category_id in(select id from sku_categories
      where number like '#{number}%') and status = 1  and id in(select sku_id from sku_on_shelves where status = 1)")
  end

  def nb_is_inventory
    flag = true
    products.each do |product|
      unless product.nb_is_inventory
        flag = false
        break
      end
    end
    flag
  end

  def main_img
    sku_image = sku_images.where(:is_main => true).first
    if !sku_image.nil?
      sku_image.image.url
    else

    end
  end

  def inventory?(quantity,store_id)
    flag = true
    sku_productships.each do |sku_product|
      unless sku_product.product.inventory?(quantity * sku_product.package_num,store_id)
        flag = false
        break
      end
    end
    flag
  end

  def shelf_status
    flag = false
    sku_on_shelves.each do |sku_on_shelf|
      if sku_on_shelf.on_shelf_time < Time.now && sku_on_shelf.off_shelf_time > Time.now  && sku_on_shelf.status == 1
        flag = true
      end
    end
    flag
  end


  def add_browsing_history(user_id)
    sku_browsing_history = sku_browsing_histories.find_by_user_id(user_id)
    if sku_browsing_history
      sku_browsing_history.quantity += 1
    else
      sku_browsing_history = sku_browsing_histories.build(:user_id => user_id)
    end
    sku_browsing_history
  end
end
