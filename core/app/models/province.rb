class Province < ActiveRecord::Base
  set_primary_key "number"
  has_many :cities, :class_name => "City", :foreign_key => "province_no"
end
