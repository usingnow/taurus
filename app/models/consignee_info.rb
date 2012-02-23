#encoding:UTF-8
class ConsigneeInfo < ActiveRecord::Base
  belongs_to :user
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"

  validates_presence_of :user_id, :district_no, :name, :address

  validates_format_of :mobile,
                      :with => /^13[0-9]{1}[0-9]{8}$|^15[012356789]{1}[0-9]{8}$|^18[0256789]{1}[0-9]{8}$/,
                      :message => "格式不正确"

  validates_format_of :phone,
                      :with => /^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/,
                      :message => "格式不正确"
end
