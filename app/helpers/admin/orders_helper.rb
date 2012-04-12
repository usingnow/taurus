#encoding:UTF-8
module Admin::OrdersHelper
  #接管
  def take_over_order(admin_id,order)
    if admin_id.nil?
      "<a href='#{take_over_admin_orders_url(:id=>order,:type => 1)}'>【我来接管】</a>" if can? :take_over, Order
    else
      if admin_id == current_administrator.id
         "<a href='#{take_over_admin_orders_url(:id=>order,:type => 0)}'>【取消接管】</a>" if can? :take_over, Order
      else
         "【接管人:#{order.administrator.name}】"
      end
    end
  end

  #过站动作
  def condition_action(action,order)
    url = ''
    if action.condition.action == "order_update"
      url = edit_admin_order_url(order,:condition_id=>action.condition.id) if can? :update, order
    elsif action.condition.action == "order_cancel"
      url = cancel_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :cancel, order
    elsif action.condition.action == "order_paid"
      url = paid_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :paid, order
    elsif action.condition.action == "output"
      url = output_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :output, order
    elsif action.condition.action == "sign_in"
      url = sign_in_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :sign_in, order
    elsif action.condition.action == "input_pay_info"
      url = input_pay_info_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :input_pay_info, order
    elsif action.condition.action == "pay_confirmation"
      url = pay_confirmation_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :pay_confirmation, order
    elsif action.condition.action == "relieve_retention"
      url = relieve_retention_admin_orders_url(:id=>order,:condition_id=>action.condition.id) if can? :relieve_retention, order
    end

    "<a href='#{url}' target='_blank'>#{action.condition.display_name}</a>" unless url.blank?
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
    format_boolean value
  end

  def format_invoice_type(value)
    Order::INVOICE_TYPE[value]
  end

  def format_is_invoice_head(value)
    Order::INVOICE_HEAD[value]
  end

  def format_delivery_status(object)
    object.delivery_order ? "已出库" : "未出库"
  end

  def order_type(object)
    object.order_details.last.sku.sku_type == 1 ? "在库品" : "直送品" if object.order_details.any?
  end
end
