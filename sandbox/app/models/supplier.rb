#encoding:UTF-8
class Supplier < ActiveRecord::Base
  ACTIVE = { 0 => "关闭", 1 => "激活" }
  validates :name, :input_person, :presence => true
end
