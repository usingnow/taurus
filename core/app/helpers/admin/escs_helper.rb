#encoding:UTF-8
module Admin::EscsHelper
  def format_esc_status(value)
    if value == 1
      "已升级"
    elsif value == 2
      "已解决"
    else
      "已回复"
    end
  end
end
