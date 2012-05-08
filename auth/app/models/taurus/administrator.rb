#encoding:UTF-8
module Taurus
  class Administrator < ActiveRecord::Base
    STATUS = { true => '是', false => '否' }

    devise :database_authenticatable, :registerable, :timeoutable,
           :recoverable, :rememberable, :trackable, :validatable, :timeout_in => 150.minutes

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :status, :name, :address, :phone,
                    :fax, :mobile, :zip_code

    validates_presence_of :password, :name, :email
  end
end  
