class SkuCategory < ActiveRecord::Base
  has_many :children,                        #固定写法，切记切记
           :class_name => 'SkuCategory',         #指明模型名
           :foreign_key => 'parent_id'      #指明关联id

  scope :index_display, where(:is_show_in_navigation => true, :is_show_in_column => true, :active => true)

  validates :root_id, :parent_id, :number, :name, :presence => true
end
