module Taurus
	class District < ActiveRecord::Base
	  belongs_to :city

	  def area
      "#{city.province.name} #{city.name} #{name}" if city
	  end
	end
end