#encoding:UTF-8
module Admin::UsersHelper
  def format_status(status)
    if status == 1
      "激活"
    else
      "锁定"
    end
  end

  def format_user_status(status)
    if status == 1
      "激活"
    else
      "锁定"
    end
  end

  #获得客户名
  def get_user_name(*args)
    user = args[0]

    if !user.nil?
      if !user.user_type.nil?
        if user.user_type == 1
          user.person_extend.name
        else
          user.company_extend.company_name
        end
      end
    end
  end

  #获得会员编号
  def get_user_number(user)
    if !user.user_type.nil?
      if user.user_type == 1
        user.person_extend.person_no
      else
        user.company_extend.company_no
      end
    end
  end

  #获得会员电话
  def get_user_phone(user)
    if !user.user_type.nil?
      if user.user_type == 1
        user.person_extend.phone
      else
        user.company_extend.phone
      end
    end
  end

  #获得会员邮箱
  def get_user_email(user)
    if !user.user_type.nil?
      if user.user_type == 1
        user.person_extend.email
      else
        user.company_extend.email
      end
    end
  end

  #获得会员性别
  def get_user_sex(user)
    if !user.user_type.nil?
      if user.user_type == 1
        format_sex(user.person_extend.sex)
      else
        format_sex(user.company_extend.sex)
      end
    end
  end

  #获得会员手机
  def get_user_mobile(user)
    if !user.user_type.nil?
      if user.user_type == 1
      else
        user.company_extend.mobile
      end
    end
  end

  #获得会员邮编
  def get_user_zip(user)
    if !user.user_type.nil?
      if user.user_type == 1
        user.person_extend.post
      else
        user.company_extend.zip
      end
    end
  end
end
