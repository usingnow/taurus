class MailSale < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :name, :district_no, :address, :zip
  validates_numericality_of :user_id, :only_integer => true
end
