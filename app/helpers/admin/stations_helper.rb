#encoding:UTF-8
module Admin::StationsHelper
  def format_station_type(value)
    if value == 0
      "开始站"
    elsif value == 1
      "结束站"
    elsif value == 2
      "异常终止站"
    elsif value == 3
      "自动站"
    else
      "普通站"
    end
  end
end
