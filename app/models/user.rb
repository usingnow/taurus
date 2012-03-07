class User < ActiveRecord::Base
  has_one :person_extend, :dependent => :destroy
  has_one :company_extend, :dependent => :destroy
  has_one :consignee_info, :dependent => :destroy
  belongs_to :role
  belongs_to :store
  has_many :orders, :dependent => :destroy
  has_many :user_addresses, :dependent => :destroy
  has_one :consignee_info, :dependent => :destroy
  has_many :favorites, :dependent => :destroy
  has_one :mail_sale, :dependent => :destroy
  accepts_nested_attributes_for :person_extend
  accepts_nested_attributes_for :company_extend
  before_validation :default_values


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :user_type, :role_id,
                  :store_id, :person_extend_attributes, :company_extend_attributes

  attr_accessor :password_confirmation, :email_confirmation, :index

  validates_presence_of :login_no
  validates_numericality_of :role_id, :status, :store_id, :only_integer => true
  validates_uniqueness_of :login_no

  private
    def default_values
      self.role_id = 2 unless self.role_id
      self.status = 1 unless self.status
      self.store_id = 1 unless self.store_id
    end

end
