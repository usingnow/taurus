#encoding:UTF-8
module Taurus
	module ProductCategoriesHelper
		def product_category_breadcrumb
			li = content_tag(:li, "#{link_to "全部", "/admin"} #{content_tag(:span, "/", :class => "divider")}".html_safe )
      
      content_tag(:ul, li.html_safe, :class => "breadcrumb breakcrumb-admin-home")
		end

    #顶级分类列表
		def top_product_categories
			if @second_categories
	      categories = content_tag(:li, "#{link_to "全部", admin_product_categories_path}".html_safe)
	      Taurus::ProductCategory.tops.each do |category|
	      	if @second_categories.first.parent_id == category.id
	        	categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe, :class => "active") 
	        else
            categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe) 
	        end      
	      end
	    else
	    	categories = content_tag(:li, "#{link_to "全部", admin_product_categories_path}".html_safe, :class => "active")
	      Taurus::ProductCategory.tops.each do |category|
	        categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe) 
	      end
	    end  
      content_tag(:ul, categories.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
		end
    
		def second_product_categories
			return unless @second_categories
			categories = ''
			@second_categories.each do |category|
				if @second_category_id.to_i == category.id
        	categories << content_tag(:li, "#{link_to category.name, thirds_admin_product_category_path(category)}".html_safe, :class => "active") 
			  else
			  	categories << content_tag(:li, "#{link_to category.name, thirds_admin_product_category_path(category)}".html_safe) 
			  end
			end
			ul = content_tag(:ul, categories.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-list')
      content_tag(:div, ul.html_safe, :class => "span2 show-grid")
		end	
	end
end