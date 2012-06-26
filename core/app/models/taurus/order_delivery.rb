module Taurus
  class OrderDelivery < ActiveRecord::Base
    attr_accessor :province_id, :city_id

  	belongs_to :order, :dependent => :destroy
  	belongs_to :district

  	validates_presence_of :district_id, :attention, :address
  	validate :phone_or_mobile

  	protected
  	def phone_or_mobile
      errors.add(:telephone, :phone_or_mobile) if telephone.blank? && mobile.blank?
  	end
  end
end