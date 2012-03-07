class Subscribe < ActiveRecord::Base
  validates :email, :uniqueness => true, :email => true
end
