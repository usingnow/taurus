#encoding:UTF-8
module ApplicationHelper
  def format_sku_type(type)
    if type == 1
      "在库品"
    elsif type == 2
      "直送品"
    end
  end

  def format_user_status(status)
    if status == 1
      "激活"
    else
      "锁定"
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
end
