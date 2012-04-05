class Administrator < ActiveRecord::Base
  has_many :administrator_groupships
  has_many :groups, :through => :administrator_groupships
  has_many :promotion_member_temps
  has_many :promotion_product_temps

  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable, :timeout_in => 15.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :name, :address, :phone,
                  :fax, :mobile, :zip

  validates_presence_of :login_no, :password, :status, :name, :email
  validates_uniqueness_of :login_no
end
