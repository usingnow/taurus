#encoding:UTF-8
module User::UserCentersHelper
  def get_favorite_categories
    html = ''
    total_count = 0
    @categories.each do |category|
      count = category.favorite_count_by_user_id(current_user.id)
      total_count += count
      html +=  content_tag(:a, "#{category.name}（#{count}）", :href => my_favorites_user_user_centers_path(:category_id => category.id))
    end
    content_tag(:a, "全部（#{total_count}）", :href => my_favorites_user_user_centers_path) + html.html_safe
  end

  #获得用户订单的操作
  def user_order_operating(order)
    station_procedureships = order.instance.station_procedureships
    html = ''
    station_procedureships.each do |station_procedureship|
      condition = station_procedureship.condition
      if condition.condition_type == 2 && condition.id != 28 && !station_procedureship.order_oper_url_id.nil?
        order_oper_url = station_procedureship.order_oper_url
        options = Hash.new
        options.store(:method, order_oper_url.link_method) unless order_oper_url.link_method.nil?
        options.store(:confirm, order_oper_url.confirm) unless order_oper_url.confirm.nil?
        options.store(:target, station_procedureship.target) unless station_procedureship.target.nil?
        if order_oper_url.url == "alipaies_path"
          href = alipaies_path(:number => order.number)
        else
          href = eval(order_oper_url.url+"(#{order.id},#{{:condition_id => condition.id}})")
        end
        html += link_to station_procedureship.condition.display_name, href, options
      end
    end
    html.html_safe
  end
end