#encoding:UTF-8
module Taurus
	module ProductCategoriesHelper
    # 顶级单品分类列表
		def top_product_categories
			if @search.category_type_eq == 0
        all_name = "全部销售单品分类"
        all_href = admin_product_categories_path
        collection = Taurus::ProductCategory.single.tops
			else
        all_name = "全部组合商品分类"
        all_href = admin_product_categories_path(:'q[category_type_eq]' => 1)
        collection = Taurus::ProductCategory.combined.tops
			end

			if @product_category
	      categories = content_tag(:li, "#{link_to all_name, all_href}".html_safe)
	      collection.each do |category|
	      	if @product_category.id == category.id
	        	categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe, :class => "active") 
	        else
            categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe) 
	        end      
	      end
	    else
	    	categories = content_tag(:li, "#{link_to all_name, all_href}".html_safe, :class => "active")
	      collection.each do |category|
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

		def back_to_parent
      if @product_category.parent_id
      	if @product_category.parent.parent_id.nil?
      	  href = seconds_admin_product_category_path(@product_category.parent_id) 
      	else
      	  href = thirds_admin_product_category_path(@product_category.parent_id) 
      	end  
        link_to "#{content_tag :i, nil, :class => "icon-arrow-left"} #{t('admin.misc.product_category.back_to_parent')}".html_safe, 
                href, :class => "btn"
      end
		end

	end
end