#encoding:UTF-8
module Taurus
  class PersonExtend < ActiveRecord::Base
    has_one :user, :as => :userable, :dependent => :destroy
    accepts_nested_attributes_for :user
    belongs_to :district
    before_create :insert_number

    SEX = { 0 => "女士", 1 => "先生" }

    validates_presence_of :name

    protected
    def insert_number
      last = PersonExtend.last
      self.number = "P" + (last ? (last.number[1,7].to_i+1).to_s.rjust(6,"0") : "000001")
    end
  end
end