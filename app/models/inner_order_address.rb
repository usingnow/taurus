class InnerOrderAddress < ActiveRecord::Base
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"
  validates_presence_of :user_id
end
