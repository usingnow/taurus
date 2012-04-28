#encoding:UTF-8
module Taurus
  module BaseHelper
    def format_boolean(boolean)
      { false => "否", true => "是" }[boolean]
    end

    def get_district_select_options
      Province.all(:order=>'number').collect{|item|[item.name,item.number]}.insert(0,["请选择..",nil])
    end

    def address(district,model)
      province_no = ''
      city_no     = ''
      district_no = ''
      cities      = []
      districts   = []

      if district.nil?
        district = District.ningbo.first
      end

      province    = district.city.province
      province_no = province.number
      cities      = province.cities.collect{ |c| [c.name, c.number]}
      city_no     = district.city.number
      districts   = district.city.districts.collect{ |d| [d.name, d.number]}
      district_no = district.number

      str = "#{select :province, :number, Province.all.collect{ |p| [p.name,p.number] },{:include_blank => "-请选择-",
                      :selected => province_no},
                      {:onchange=>"jQuery.ajax({ type: 'get',
                                                 url:'/admin/cities/ajax',
                                                 data: 'province_no='+this.value,
                                                 success: function(msg){
                                                   jQuery('#city_number').html(msg);
                                                   jQuery('##{model}_district_no').html('<option value=>-请选择-</option>');
                                                 }});", :required => "required"} }
              #{select :city, :number, cities,{:include_blank => "-请选择-", :selected => city_no},
                       { :onchange => "jQuery.ajax({ type:'get',
                                       url: '/admin/districts/ajax',
                                       data: 'city_no='+this.value,
                                       success: function(msg){
                                        jQuery('##{model}_district_no').html(msg);
                                       }});", :required => "required"} }

              #{select model.to_sym, :district_no, districts, {:include_blank => "-请选择-", :selected => district_no},
                       :required => "required"}"
      str
    end

    def functions
      data = Taurus::Function.all
      str = ""
      data.each do |com|
        fun_str = "<ul>"
        com['functions'].each do |fun|
          fun_str += "<li>#{link_to fun['name'], fun['url']}</li>"
        end
        fun_str += "</ul>"
        str += "<h3>#{com['name']}</h3>"+fun_str
      end
      str.html_safe
      Taurus
    end

    def order_indicator_for(order)
      if order == 'asc'
        '&uarr;'
      elsif order == 'desc'
        '&darr;'
      else
        nil
      end
    end

    def cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "cny")
    end

    def grey_cny(price)
      content_tag(:em, (number_to_currency price, :unit => "￥"), :class => "grey_cny")
    end

    def area(object)
      object.district ? object.district.address : ""
    end
    
    def error_messages(object)
      if object.errors.any?
        h2 = content_tag(:h2, I18n.t('activerecord.errors.template.header.default'))
        li = ''
        object.errors.full_messages.each do |msg|
          li += content_tag(:li, msg)
        end
        ul = content_tag(:ul, li.html_safe)
        content_tag(:div, h2+ul, :id => "error_explanation").html_safe
      end
    end

    def symbol_label(content,options={})
      label_tag "", content+"：", options
    end

    private

      def format_value(value,hash)
        hash[value] ||= "无"
      end
  end
end