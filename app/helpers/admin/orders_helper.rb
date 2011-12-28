#encoding:UTF-8
module Admin::OrdersHelper
  #接管
  def take_over_order(admin_id,order)
    if admin_id == nil
      "<a href='#{take_over_admin_orders_url(:admin_id=>1,:id=>order)}'>【我来接管】</a>"
    else
      "<a href='#{take_over_admin_orders_url(:id=>order)}'>【取消接管】</a>"
    end
  end

  #过站动作
  def condition_action(action,order)
    url = ''
    if action.condition.action == "order_update"
      url = edit_admin_order_url(order,:condition_id=>action.condition.id)
    elsif action.condition.action == "order_cancel"
      url = cancel_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    elsif action.condition.action == "order_paid"
      url = paid_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    elsif action.condition.action == "output"
      url = output_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    elsif action.condition.action == "sign_in"
      url = sign_in_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    end

    "<a href='#{url}'>#{action.condition.display_name}</a>"
  end

  #获得客户名
  def get_user_name(user)
    if !user.user_type.nil?
      if user.user_type == 1
        user.person_extend.name
      else
        user.company_extend.name
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


  #获得制单人
  def get_make_by(order)
    if order.created_admin_id == nil
      get_user_name(order.user)
    else
      order.make_admin.name
    end
  end

  #格式话是否安装与组装
  def format_is_need(value)
    if value == 1
      "是"
    else
      "否"
    end
  end

  def format_invoice_type(value)
    if value == 0
      "普通"
    else
       "增值税发票"
    end
  end

  def format_is_invoice_head(value)
    if value == 0
      "个人"
    else
      "单位"
    end
  end
end
