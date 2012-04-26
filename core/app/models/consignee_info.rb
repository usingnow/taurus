#encoding:UTF-8
class ConsigneeInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"

  validates_presence_of :user_id, :district_no, :name, :address

end
