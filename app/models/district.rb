class District < ActiveRecord::Base
  set_primary_key "number"
  belongs_to :city, :class_name => "City", :foreign_key => "city_no"
end
