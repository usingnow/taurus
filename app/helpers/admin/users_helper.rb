#encoding:UTF-8
module Admin::UsersHelper
  def format_status(status)
    if status == 1
      "激活"
    else
      "锁定"
    end
  end
end
