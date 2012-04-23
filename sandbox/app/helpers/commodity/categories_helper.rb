#encoding:UTF-8
module Commodity::CategoriesHelper
  def get_category_search_categories
    html = ''
    if @sku_category.number.to_s.length == 2
      html += content_tag(:h3, @sku_category.name)
      @sku_category.children.navigation.each do |child|
        html += content_tag(:h4, (link_to child.name, commodity_category_path(child.id)), :class => "indent_20")
      end
    elsif @sku_category.number.to_s.length == 4
      html += content_tag(:h3, @sku_category.parent.name)
      html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_20 highlight")
      @sku_category.children.navigation.each do |child|
        html += content_tag(:h4, (link_to child.name, commodity_category_path(child.id)), :class => "indent_40")
      end
      @sku_category.parent.children.navigation.each do |category|
        html += content_tag(:h4, (link_to category.name, commodity_category_path(category.id)), :class => "indent_20") unless category.id == @sku_category.id
      end
    else
      html += content_tag(:h3, @sku_category.root.name)
      if @sku_category.number.to_s.length == 6
        html += content_tag(:h4, (link_to @sku_category.parent.name, commodity_category_path(@sku_category.parent.id)), :class => "indent_20")
        html += content_tag(:h4, (link_to @sku_category.name, commodity_category_path(@sku_category.id)), :class => "indent_40 highlight")
        @sku_category.parent.children.navigation.each do |category|
          html += content_tag(:h4, (link_to category.name, commodity_category_path(category.id)), :class => "indent_40") unless category.id == @sku_category.id
        end
        @sku_category.root.children.navigation.each do |category|
          html += content_tag(:h4, (link_to category.name, commodity_category_path(category.id)), :class => "indent_20") unless category.id == @sku_category.parent.id
        end
      else
        html += content_tag(:h4, (link_to @sku_category.parent.parent.name, commodity_category_path(@sku_category.parent.parent.id)), :class => "indent_20")
        html += content_tag(:h4, (link_to @sku_category.parent.name, commodity_category_path(@sku_category.parent.id)), :class => "indent_40 highlight")
        @sku_category.parent.parent.children.navigation.each do |category|
          html += content_tag(:h4, (link_to category.name, commodity_category_path(category.id)), :class => "indent_40") unless category.id == @sku_category.id
        end
        @sku_category.root.children.navigation.each do |category|
          html += content_tag(:h4, (link_to category.name, commodity_category_path(category.id)), :class => "indent_20") unless category.id == @sku_category.parent.id
        end
      end
    end
    html.html_safe
  end
end