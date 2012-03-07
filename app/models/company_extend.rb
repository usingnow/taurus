#encoding:UTF-8
class CompanyExtend < ActiveRecord::Base
  belongs_to :user
  belongs_to :role
  belongs_to :industry
  belongs_to :company_type
  belongs_to :company_scale
  belongs_to :district, :class_name => "District", :foreign_key => "district_no"
  before_save :default_values

  validates_presence_of :company_name, :district_no, :name
  validates_uniqueness_of :company_name

  private
    def default_values
      number = UserNumber.last
      number.company_no += 1
      number.save
      self.company_no = "P" + number.company_no.to_s.rjust(6,"0") unless self.company_no
      self.created_by = "用户注册" unless self.created_by
      self.updated_by = "用户注册" unless self.updated_by
    end
end
