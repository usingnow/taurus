class InnerOrderPayment < ActiveRecord::Base
  validates_presence_of :user_id

end
