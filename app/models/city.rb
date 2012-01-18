class City < ActiveRecord::Base
  set_primary_key "number"
  belongs_to :province, :class_name => "Province", :foreign_key => "province_no"
  has_many :districts, :class_name => "District", :foreign_key => "city_no"
end
