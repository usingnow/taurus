#encoding:UTF-8
module Taurus
  class Administrator < ActiveRecord::Base
    STATUS = { true => '是', false => '否' }
    LANGUAGE = { 'zh-CN' => "Simplified Chinese (简体中文)", 'en' => "English" }

    devise :database_authenticatable, :registerable, :timeoutable,
           :recoverable, :rememberable, :trackable, :validatable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :status, :name, :address, :phone,
                    :fax, :mobile, :zip_code, :language, :admin_type
    
    has_many :administrator_group_line_items, :dependent => :destroy
    has_many :groups, :through => :administrator_group_line_items

    validates_presence_of :name, :email
  end
end  
