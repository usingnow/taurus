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
end