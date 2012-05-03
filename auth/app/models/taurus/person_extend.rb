#encoding:UTF-8
module Taurus
  class PersonExtend < ActiveRecord::Base
    has_one :user, :as => :taurus_userable, :dependent => :destroy
    belongs_to :role
    belongs_to :district, :class_name => "District", :foreign_key => "district_no"
    before_save :default_values


    validates_presence_of :name, :address ,:phone
    validates_presence_of :district_no ,:message => "请选择"

    private
      def default_values
        number = UserNumber.last
        number.person_no += 1
        number.save
        self.person_no = "P" + number.person_no.to_s.rjust(6,"0") unless self.person_no
        self.created_by = "用户注册" unless self.created_by
        self.updated_by = "用户注册" unless self.updated_by
      end
  end
end