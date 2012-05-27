#encoding:UTF-8
module Taurus
	module ProductCategoriesHelper
    # 顶级分类列表
		def top_product_categories
			if @product_category
	      categories = content_tag(:li, "#{link_to "全部", admin_product_categories_path}".html_safe)
	      Taurus::ProductCategory.tops.each do |category|
	      	if @product_category.id == category.id
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
      content_tag(:ul, categories.html_safe, :id => 'admin-main-functionality', :class => 'nav nav-pills')
		end
    
		def second_product_categories
			return unless @product_category
			categories = content_tag(:li,  @product_category.name, :class => "nav-header")
			categories << content_tag(:li, '', :class => 'divider')
			@product_category.children.each do |category|
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