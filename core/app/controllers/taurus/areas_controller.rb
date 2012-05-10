module Taurus
	class AreasController < BaseController
		def cities
			if params[:province_id].blank?
      	@cities = []
    	else
    		@cities = City.find_all_by_province_id(params[:province_id])
    	end
		end

		def districts
			if params[:city_id].blank?
      	@districts = []
    	else
    		@districts = District.find_all_by_city_id(params[:city_id])
    	end
		end
	end
end	