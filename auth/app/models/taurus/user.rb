#encoding:UTF-8
module Taurus
  class User < ActiveRecord::Base
    belongs_to :taurus_userable, :polymorphic => true, :dependent => :destroy
    belongs_to :role


    devise :database_authenticatable, :registerable, :timeoutable,
           :recoverable, :rememberable, :trackable, :validatable, :timeout_in => 150.minutes



    attr_accessible :email, :password, :password_confirmation, :remember_me, :status, :role_id,
                    :points

    validates_presence_of :email, :role_id

  end
end  
