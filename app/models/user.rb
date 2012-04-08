#encoding:UTF-8
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
  has_many :back_order_skus, :dependent => :destroy
  accepts_nested_attributes_for :person_extend
  accepts_nested_attributes_for :company_extend
  before_validation :default_values


  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable



  attr_accessible :email, :login_no, :password, :password_confirmation, :remember_me, :status, :user_type, :role_id,
                  :store_id, :person_extend_attributes, :company_extend_attributes

  attr_accessor :password_confirmation, :email_confirmation, :index

  validates_presence_of :login_no
  validates_numericality_of :role_id, :status, :store_id, :only_integer => true
  validates_uniqueness_of :login_no

  def name
    if user_type == 1
      person_extend.name
    elsif user_type == 2
      company_extend.company_name
    else
      "无"
    end
  end

  #后台订单临时商品统计
  def admin_temp_installation_cost
    back_order_skus.to_a.sum { |temp| temp.is_need_install ? temp.sku.installation_cost_aft_tax : 0 }
  end

  def admin_temp_assembling_fee
    back_order_skus.to_a.sum { |temp| temp.is_need_assemble ? temp.sku.assembling_fee_aft_tax : 0 }
  end

  private
    def default_values
      self.role_id = 2 unless self.role_id
      self.status = 1 unless self.status
      self.store_id = 1 unless self.store_id
    end
end
