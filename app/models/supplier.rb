#encoding:UTF-8
class Supplier < ActiveRecord::Base
  validates :name, :input_person, :presence => true


end
