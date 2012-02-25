#encoding:UTF-8
class SkuDisplay < ActiveRecord::Base
  belongs_to :sku
  attr_accessor :sku_number

  def page_enum
    { 0 => '首页', 1 => 'OA PC用品', 2 => '文具办公用品', 3 => '生活用品', 4 => '办公家具', 5 => '生活家具', 6 => '家居饰品' }
  end

  def location_enum(page)
    # 0 => { 0 => '推荐商品', 1 => 'OA PC', 2  => 'OA PC热销排行', 3  => '文具办公用品', 4  => '文具办公用品热销排行',
    #        5  => '生活用品', 6  => '生活用品热销排行', 7  => '办公家具', 8  => '办公家具热销排行', 9  => '生活家具',
    #        10  => '生活家具热销排行', 11  => '家居饰品', 12  => '家居饰品热销排行'}

    x = { 0 => { 0 => '推荐商品' } }

        
    x[page]
  end

  validates_presence_of :sku_id, :sku_number, :sequence, :page, :location
end
