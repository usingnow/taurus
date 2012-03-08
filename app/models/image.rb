#encoding:UTF-8
class Image < ActiveRecord::Base
  has_attached_file :image,
                    :url => lambda{ |l| "/paperclip_assets/images/#{l.instance.location}/:id.:extension" },
                    :path => lambda{ |l| ":rails_root/public/paperclip_assets/images/#{l.instance.location}/:id.:extension" }

  def line_type_enum
    { 0 => '自定义', 1 => '链接' }
  end

  def page_enum
    { 0 => '首页', 1 => 'OA PC用品', 2 => '文具办公用品', 3 => '生活用品', 4 => '办公家具', 5 => '生活家具', 6 => '家居饰品' }
  end

  def location_enum(page)
    x = { 0 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一' },
          1 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一', 11 => '十二', 12 => '十三', 13 => '十四', 14 => '十五' },
          2 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一', 11 => '十二' },
          3 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一', 11 => '十二', 12 => '十三', 13 => '十四', 14 => '十五', 15 => '十六',
                16 => '十七', 17 => '十八' },
          4 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一' },
          5 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九',
                9 => '十', 10 => '十一', 11 => '十二' },
          6 => { 0 => '一', 1 => '二', 2 => '三', 3 => '四', 4 => '五', 5 => '六', 6 => '七', 7 => '八', 8 => '九' }
    }
    x[page]
  end

  validates_presence_of :page, :location
end
