#encoding:UTF-8
module Commodity::Index::SkusHelper
  def sku_search_categories
    html = ''
    @categories.each do |category|
      count = category.sku_count_by_keywords @keywords
      if count > 0
        html += content_tag(:h4, (link_to "#{category.name}（#{count}）", commodity_category_path(category.id)))
        li = ''
        category.children.each do |child|
          child_count = child.sku_count_by_keywords @keywords
          if child_count > 0
            li += content_tag(:li, (link_to "#{child.name}（#{child_count}）", commodity_category_path(child.id)))
          end
        end
        html += content_tag(:ul, li.html_safe)
      end
    end
    html.html_safe
  end
end