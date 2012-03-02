#encoding:UTF-8
module Commodity::CategoriesHelper
  def get_category_search_categories
    html = ''
    parent = @sku_category.parent
    if @sku_category.number.to_s.length == 4
      html += content_tag(:h3, (link_to parent.name, commodity_category_path(parent.id)))
      html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_20")
      @sku_category.children.index_display.each do |child|
        html += content_tag(:h4, (link_to child.name, commodity_category_path(child.id)), :class => "indent_40")
      end
    else
      grandfather = parent.parent
      html += content_tag(:h3, (link_to grandfather.name, commodity_category_path(grandfather.id)))
      html += content_tag(:h4, (link_to parent.name, commodity_category_path(parent.id)), :class => "indent_20")
      html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_40")
    end
    html.html_safe
  end
end