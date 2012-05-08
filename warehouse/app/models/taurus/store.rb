#encoding:UTF-8
module Taurus
	class Store < ActiveRecord::Base
		validates_presence_of :name
	end
end