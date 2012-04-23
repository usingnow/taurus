class InnerOrderPayment < ActiveRecord::Base
  belongs_to :procedure

  validates_presence_of :user_id
end
