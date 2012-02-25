class SkuCategory < ActiveRecord::Base
  has_many :children, :class_name => 'SkuCategory', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'SkuCategory', :foreign_key => 'parent_id'


  scope :index_display, where(:is_show_in_navigation => true, :is_show_in_column => true, :active => true)

  validates :root_id, :parent_id, :number, :name, :presence => true

  def sku_count_by_keywords(keywords)
    Sku.count(:conditions => "sku_category_id in(select id from sku_categories where number like '#{number}%')
      and status = 1 and name like '%#{keywords}%'  and id in(select sku_id from sku_on_shelves where status = 1)")
  end

  def skus
    Sku.where("sku_category_id in(select id from sku_categories where number like '#{number}%')
      and status = 1 and id in(select sku_id from sku_on_shelves where status = 1)")
  end
end
