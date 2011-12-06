class Admin < ActiveRecord::Base
  validates :login_no, :password,:question,:answer,:name, :presence => true
  validates :email, :email => {:message => :email}
end
