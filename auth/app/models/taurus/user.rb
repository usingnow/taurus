#encoding:UTF-8
module Taurus
  class User < ActiveRecord::Base
    STATUS = { true => "激活", false => "未激活" }
    belongs_to :userable, :polymorphic => true, :dependent => :destroy
    belongs_to :role
    has_many :orders

    before_create :default_value

    devise :database_authenticatable, :registerable, :timeoutable,
           :recoverable, :rememberable, :trackable, :validatable, :timeout_in => 150.minutes



    attr_accessible :email, :password, :password_confirmation, :remember_me, :role_id,
                    :points, :status

    validates_presence_of :email, :role_id

    def self.find_for_authentication(conditions={}) 
      conditions[:status] = true 
      find(:first, :conditions => conditions) 
    end 

    protected
      def default_value
        self.status = true 
      end

  end
end  
