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

  def address(district_no,model)
    str = "#{select :province, :province_id,Province.all.collect{ |p| [p.name,p.number] },{:include_blank => "-请选择-"},
                    {:onchange=>"jQuery.ajax({ type: 'get',
                                     url:'/admin/cities/ajax',
                                     data: 'province_no='+this.value,
                                     success: function(msg){
                                      $('#cities').html(msg);
                                      $('#districts').html('<option value=>-请选择-</option>');
                                     }});"} }省份

            <select id=\"cities\" name=\"district[city_no]\" class=\"required\" title=\"请选择城市\"
            onchange=\"jQuery.ajax({ type:'get',
                                     url: '/admin/districts/ajax',
                                     data: 'city_no='+this.value,
                                     success: function(msg){
                                     $('#districts').html(msg);
                                     }});\">
              <option>-请选择-</option>
            </select>城市
            <select id=\"districts\" name=\"#{model}[district_no]\"
                    class=\"required\" title=\"请选择区县\">
              <option value=\"\">-请选择-</option>
            </select>区县"
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
