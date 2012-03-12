class SkuCategory < ActiveRecord::Base
  has_many :children, :class_name => 'SkuCategory', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'SkuCategory', :foreign_key => 'parent_id'
  scope :navigation, where(:is_show_in_navigation => true, :active => true)
  scope :top_navigation, where(:is_show_in_navigation => true, :active => true, :parent_id => nil)


  validates :root_id, :parent_id, :number, :name, :presence => true

  def sku_count_by_keywords(keywords)
    Sku.count(:conditions => "sku_category_id in(select id from sku_categories where number like '#{number}%')
      and (name like '%#{keywords}%' or number like '%#{keywords}%') and id in(select sku_id from sku_on_shelves where status = 1)")
  end

  def skus
    Sku.where("sku_category_id in(select id from sku_categories where number like '#{number}%')
      and id in(select sku_id from sku_on_shelves where status = 1)")
  end

  def favorite_count_by_user_id(user_id)
    Favorite.count(:joins => "inner join skus on favorites.sku_id = skus.id and sku_category_id = #{id} where favorites.user_id = #{user_id}")
  end
end
