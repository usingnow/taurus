#encoding:UTF-8
module Admin::OrdersHelper
  #接管
  def take_over_order(admin_id,order)
    if admin_id.nil?
      "<a href='#{take_over_admin_orders_url(:id=>order,:type => 1)}'>【我来接管】</a>"
    else
      "<a href='#{take_over_admin_orders_url(:id=>order,:type => 0)}'>【取消接管】</a>"
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
    elsif action.condition.action == "input_pay_info"
      url = input_pay_info_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    elsif action.condition.action == "pay_confirmation"
      url = pay_confirmation_admin_orders_url(:id=>order,:condition_id=>action.condition.id)
    end

    "<a href='#{url}'>#{action.condition.display_name}</a>"
  end

  #获得制单人
  def get_make_by(order)
    if order.created_admin_id.nil?
      get_user_name(order.user)
    else
      order.make_administrator.name
    end
  end

  #获得制单人 不显示客户名
  def fetch_make_by(order)
    if order.created_admin_id.nil?
      "客户"
    else
      order.make_administrator.name
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

  def is_store(detail,store_id)
    result = ""
    detail.sku.products.each do |prod|
      prod.product_storeships.each do |prod_store|
        if prod_store.store_id == store_id
          if prod_store.quantity < 1
            result = "无库存"
          end
        else

        end
      end
    end
  end
end
