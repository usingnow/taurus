#encoding:UTF-8
class AreaInput < SimpleForm::Inputs::Base
  def input
    provinces = Taurus::Province.all

    province_options = '<option value>--请选择省--</option>'
    city_options = '<option value>--请选择市--</option>'
    collection = []
    if @builder.object.send(attribute_name)
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

    input_options.merge!(:include_blank => "--请选择区--")
    input_html_options.merge!(:id => "district_id")
  	"<select id='province_id' #{input_options[:disabled] ? "disabled='disabled'" : ""}>#{province_options}</select> " +
  	"<select id='city_id' #{input_options[:disabled] ? "disabled='disabled'" : ""}>#{city_options}</select> " +
  	@builder.collection_select(
  		attribute_name, collection, :id, :name, input_options, input_html_options
  	)
  end
end