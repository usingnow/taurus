#encoding:UTF-8
module Taurus
	module ProductCategoriesHelper
    # 顶级单品分类列表
		def top_single_categories
			if @product_category
			  options = {}
			else
        options = @search.category_type_eq == 0 ? { :class => "active" }  : {}
			end

			categories = content_tag(:li, "#{link_to "全部销售单品分类", admin_product_categories_path}".html_safe, options)	

      Taurus::ProductCategory.single.tops.each do |category|
      	options = Hash.new
      	if @product_category
        	options = @product_category.id == category.id ? { :class => "active" } : {}
        end
        categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe, options) 
      end
      content_tag(:ul, categories.html_safe, :class => 'nav nav-pills')
		end

		# 顶级组合商品分类列表
	 	def top_combined_categories
      if @product_category
			  options = {}
			else
        options = @search.category_type_eq == 1 ? { :class => "active" }  : {}
			end

			categories = content_tag(:li, "#{link_to "全部组合商品分类", admin_product_categories_path(:'q[category_type_eq]' => 1)}".html_safe, options)	

      Taurus::ProductCategory.combined.tops.each do |category|
      	options = Hash.new
      	if @product_category
        	options = @product_category.id == category.id ? { :class => "active" } : {}
        end
        categories << content_tag(:li, "#{link_to category.name, seconds_admin_product_category_path(category)}".html_safe, options) 
      end
      content_tag(:ul, categories.html_safe, :class => 'nav nav-pills trk-non-inline-margin')
		end

		def second_product_categories
			unless @product_category
        if @search.category_type_eq == 0
          header_name = "全部销售单品分类"
          collection  = Taurus::ProductCategory.single.tops
        else
          header_name = "全部组合商品分类"
          collection  = Taurus::ProductCategory.combined.tops
        end
        current_category_id = nil
        category_href       = "seconds_admin_product_category_path(category)"
      else 
        header_name         = @product_category.name
        collection          = @product_category.children
        current_category_id = @second_category_id.to_i
        category_href       = "thirds_admin_product_category_path(category)"
      end

      categories = content_tag(:li,  header_name, :class => "nav-header")
      categories << content_tag(:li, '', :class => 'divider')
      collection.each do |category|
        if current_category_id == category.id
          categories << content_tag(:li, "#{link_to category.name, eval(category_href)}".html_safe, :class => "active") 
        else
          categories << content_tag(:li, "#{link_to category.name, eval(category_href)}".html_safe) 
        end
      end
      ul = content_tag(:ul, categories.html_safe, :class => 'nav nav-list')
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

    def form_cancel_btn
      if @product_category.parent_id
        if @product_category.parent.parent_id.nil?
          href = seconds_admin_product_category_path(@product_category.parent_id) 
        else
          href = thirds_admin_product_category_path(@product_category.parent_id) 
        end
      else
        href = admin_product_categories_path(:'q[category_type_eq]' => @product_category.category_type)
      end

      link_to t('admin.misc.cancel'), href, :class => "btn"
    end

	end
end