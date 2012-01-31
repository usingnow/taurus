class User < ActiveRecord::Base
  has_one :person_extend
  has_one :company_extend
  belongs_to :role
  belongs_to :store
  accepts_nested_attributes_for :person_extend
  accepts_nested_attributes_for :company_extend

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :user_type, :role_id, :store_id

  attr_accessor :password_confirmation, :email_confirmation, :index

  validates_presence_of :login_no
  validates_uniqueness_of :login_no
end
