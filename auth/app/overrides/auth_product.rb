Deface::Override.new(:virtual_path => "taurus/admin/products/index",
                     :name => "auth_product_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Product %>
	  <a href=\"<%= new_admin_product_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('admin.misc.product.single')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/products/index",
                     :name => "auth_product_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Product %>
	  <a href=\"<%= edit_admin_product_path(product) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/shared/_product_tabs",
                     :name => "auth_product_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Product %>
	  <a href=\"<%= edit_admin_product_path(@product) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end