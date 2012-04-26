#encoding:UTF-8
class InnerOrderAddress < ActiveRecord::Base
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"
  belongs_to :user

  validates_presence_of :user_id, :name, :district_no, :address

  validates_format_of :mobile,
                      :with => /^13[0-9]{1}[0-9]{8}$|^15[012356789]{1}[0-9]{8}$|^18[0256789]{1}[0-9]{8}$/,
                      :message => "格式不正确"
end
