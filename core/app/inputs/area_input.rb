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
    
    province_input_options = city_input_options = input_options.clone
    province_input_html_options = city_input_html_options = input_html_options.clone

    @builder.select(
      :district_id, province_options.html_safe, province_input_options, 
      province_input_html_options.merge!(:name => "province_id", :id => "province_id")
    ) + " " +
    @builder.select(
      :district_id, city_options.html_safe, city_input_options, 
      city_input_html_options.merge!(:name => "city_id", :id => "city_id")
    ) + " " +
  	@builder.collection_select(
  		attribute_name, collection, :id, :name, input_options.merge!(:include_blank => "--请选择区--"), 
      input_html_options.merge!(:id => "district_id")
  	)
  end
end