#encoding:UTF-8
module Taurus
	module ProductsHelper
    def product_breadcrumb(object)
    	li = content_tag :li do
        content_tag(:i, "", :class => "icon-home") + 
        link_to("首页", "/") +
        content_tag(:span, "/", :class => "divider")
      end
      
      category = object.product_category
      
      category_li = ''
      if category
        while category do
          content = category.name + content_tag(:span, "/", :class => "divider")
          category_li = content_tag(:li, content.html_safe) + category_li
          category = category.parent
        end
      end

      li << category_li.html_safe
      
      li << content_tag(:li, object.name, :class => "active")
      content_tag(:ul, li, :class => "breadcrumb")
    end
	end
end