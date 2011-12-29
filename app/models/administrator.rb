class Administrator < ActiveRecord::Base
  # Include default admin modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :name, :address, :phone,
                  :fax, :mobile, :zip

  validates_presence_of :login_no
end
