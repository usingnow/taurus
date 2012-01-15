class City < ActiveRecord::Base
  set_primary_key "number"
  belongs_to :province, :class_name => "Province", :foreign_key => "province_no"
end
