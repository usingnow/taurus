#encoding:UTF-8
module ApplicationHelper
  def format_boolean(boolean)
    if boolean == true
      "是"
    else
      "否"
    end
  end

  def is_blank(value)
    if value == ''

    else
      value
    end
  end

  def set_odd_even_class(value)
    if value[0]!=1
      "even"
    else
      "odd"
    end
  end

  def format_sex(value)
    if !value.nil?
      if value == 0
        "男"
      else
        "女"
      end
    end
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

    if !district.nil?
      province    = district.city.province
      province_no = province.number
      cities      = province.cities.collect{ |c| [c.name, c.number]}
      city_no     = district.city.number
      districts   = district.city.districts.collect{ |d| [d.name, d.number]}
      district_no = district.number
    end

    str = "#{select :province, :number, Province.all.collect{ |p| [p.name,p.number] },{:include_blank => "-请选择-",
                    :selected => province_no},
                    {:onchange=>"jQuery.ajax({ type: 'get',
                                               url:'/admin/cities/ajax',
                                               data: 'province_no='+this.value,
                                               success: function(msg){
                                                $('#city_number').html(msg);
                                                $('##{model}_district_no').html('<option value=>-请选择-</option>');
                                               }});", :required => "required"} }省份
            #{select :city, :number, cities,{:include_blank => "-请选择-", :selected => city_no},
                     { :onchange => "jQuery.ajax({ type:'get',
                                     url: '/admin/districts/ajax',
                                     data: 'city_no='+this.value,
                                     success: function(msg){
                                     $('##{model}_district_no').html(msg);
                                     }});", :required => "required"} }城市

            #{select model.to_sym, :district_no, districts, {:include_blank => "-请选择-", :selected => district_no},
                     :required => "required"}区县"
    str
  end

  def functions
    str = ""
    Component.all.each do |com|
      fun_str = "<ul>"
      com_flag = false
      com.functions.each do |fun|
        flag = false
        fun.operatings.each do |oper|
          current_administrator.groups.each do |group|
            group.permissions.each do |per|
              if oper.id == per.operating_id
                flag = true
              end
            end
          end
        end

        if flag == true
          fun_str += "<li>#{link_to fun.name, fun.url}</li>"
          com_flag = true
        end
      end
      fun_str += "</ul>"
      if com_flag == true
        str += "<h3>#{com.name}</h3>"+fun_str
      end
    end
    str
  end

  def sub_str(str,length)
    str[0,length]
  end
end
