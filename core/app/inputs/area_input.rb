#encoding:UTF-8
class AreaInput < SimpleForm::Inputs::Base
  def input
    provinces = Taurus::Province.all

    province_options = '<option>--请选择省--</option>'
    city_options = '<option>--请选择市--</option>'
    collection = []
    if @builder.object.send(attribute_name.to_sym)
      provinces.each do |province| 
      	if @builder.object.district.city.province_id == province.id
	    		province_options << "<option value=\"#{province.id}\" selected=\"selected\">#{province.name}</option>"
	    	else
	    		province_options << "<option value=\"#{province.id}\">#{province.name}</option>"
	    	end	
	    end
      @builder.object.district.city.province.cities.each do |city|
      	if @builder.object.district.city_id == city.id
      		city_options << "<option value=\"#{city.id}\" selected=\"selected\">#{city.name}</option>"
      	else	
      		city_options << "<option value=\"#{city.id}\">#{city.name}</option>"
      	end	
      end
      collection = @builder.object.district.city.districts
    else
	    provinces.each do |province| 
	    	province_options << "<option value=\"#{province.id}\">#{province.name}</option>"
	    end	
  	end
  	"<select id='province_id'>#{province_options}</select> " +
  	"<select id='city_id'>#{city_options}</select> " +
  	@builder.collection_select(
  		attribute_name, collection, :id, :name, {:include_blank => "--请选择区--"}, {:id => "district_id"}
  	)
  end
end