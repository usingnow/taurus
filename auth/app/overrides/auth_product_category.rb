Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::ProductCategory %>
	  <a href=\"<%= new_admin_product_category_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/product_category')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::ProductCategory %>
	  <a href=\"<%= edit_admin_product_category_path(product_category) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_custom",
                     :replace => ".custom_tag") do
  "<% if can? :manage, Taurus::CustomProperty %>
    <a href=\"<%= admin_product_category_custom_properties_path(product_category) %>\" 
       class=\"btn btn-primary trk-btn-short custom_tag\">
      <%= t('activerecord.attributes.taurus/product_category.custom_property') %>
    </a>
  <% end %>"                      
end

Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :destroy, Taurus::ProductCategory %>
    <a href=\"<%= admin_product_category_path(product_category) %>\" data-method=\"delete\"
      data-confirm=\"<%= t('admin.actions.delete.confirm') %>\" 
       class=\"btn btn-danger trk-btn-short destroy_tag\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/product_categories/show",
                     :name => "auth_product_category_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::ProductCategory %>
	  <a href=\"<%= edit_admin_product_category_path(@product_category) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/product_categories/show",
                     :name => "auth_product_category_show_custom",
                     :replace => "#custom_tag") do
  "<% if can? :manage, Taurus::CustomProperty %>
    <a href=\"<%= admin_product_category_custom_properties_path(@product_category) %>\" 
       class=\"btn btn-primary\" id=\"custom_tag\">
      <i class=\"icon-wrench\"></i>
      <%= t('activerecord.attributes.taurus/product_category.custom_property') %>
    </a> 
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/product_categories/show",
                     :name => "auth_product_category_show_destroy",
                     :replace => "#destroy_tag") do
  "<% if can? :destroy, Taurus::ProductCategory %>
    <a href=\"<%= admin_product_category_path(@product_category) %>\" data-method=\"delete\"
       data-confirm=\"<%= t('admin.actions.delete.confirm') %>\" 
       class=\"btn btn-danger\" id=\"destroy_tag\">
      <i class=\"icon-remove-sign\"></i>
      <%= t('admin.actions.delete.menu') %>
    </a>  
  <% end %>"                      
end