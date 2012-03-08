#encoding:UTF-8
module Commodity::CategoriesHelper
  def get_category_search_categories
    html = ''
    if @sku_category.number.to_s.length == 2
      html += content_tag(:h3, @sku_category.name)
      @sku_category.children.index_display.each do |child|
        html += content_tag(:h4, (link_to child.name, commodity_category_path(child.id)), :class => "indent_20")
        child.children.index_display.each do |grandson|
          html += content_tag(:h4, (link_to grandson.name, commodity_category_path(grandson.id)), :class => "indent_40")
        end
      end
    elsif @sku_category.number.to_s.length == 4
      html += content_tag(:h3, @sku_category.parent.name)
      html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_20")
      @sku_category.children.index_display.each do |child|
        html += content_tag(:h4, (link_to child.name, commodity_category_path(child.id)), :class => "indent_40")
      end
    else
      html += content_tag(:h3, @sku_category.parent.parent.name)
      html += content_tag(:h4, (link_to @sku_category.parent.name, commodity_category_path(@sku_category.parent.id)), :class => "indent_20")
      html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_40")
    end
    html.html_safe
  end
end