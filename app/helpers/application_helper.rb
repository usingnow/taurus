#encoding:UTF-8
module ApplicationHelper
  def format_sku_type(type)
    if type == 1
      "在库品"
    elsif type == 2
      "直送品"
    end
  end

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
end
