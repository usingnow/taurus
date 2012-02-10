class SkuCategory < ActiveRecord::Base
  has_many :children, :class_name => 'SkuCategory', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'SkuCategory', :foreign_key => 'parent_id'

  scope :index_display, where(:is_show_in_navigation => true, :is_show_in_column => true, :active => true)

  validates :root_id, :parent_id, :number, :name, :presence => true
end
