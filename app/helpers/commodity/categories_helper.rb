#encoding:UTF-8
module Commodity::CategoriesHelper
  def get_category_search_categories(object)
    html = ''
    if object.number.to_s.length == 4
      html += content_tag(:h3, object.parent.name)
      html += content_tag(:h4, object.name, :class => "indent_20")
      object.children.index_display.each do |child|
        html += content_tag(:h4, child.name, :class => "indent_40")
      end
    else
      html += content_tag(:h3, object.parent.parent.name)
      html += content_tag(:h4, object.parent.name, :class => "indent_20")
      html += content_tag(:h4, object.name, :class => "indent_40")
    end
    html.html_safe
  end
end