class Admin < ActiveRecord::Base
  validates :login_no, :password, :presence => true
  validates :email,:format => {:with=>/@/,:message=>'123'}
end
