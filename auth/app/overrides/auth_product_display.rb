Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::ProductDisplay %>
	  <a href=\"<%= new_admin_product_display_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/product_display')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::ProductDisplay %>
	  <a href=\"<%= edit_admin_product_display_path(product_display) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :destroy, Taurus::ProductDisplay %>
    <a href=\"<%= admin_product_display_path(product_display) %>\" data-method=\"delete\"
       data-confirm=\"<%= t('admin.actions.delete.confirm') %>\"
       class=\"btn btn-primary trk-btn-short destroy_tag\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/product_displays/show",
                     :name => "auth_product_display_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::ProductDisplay %>
	  <a href=\"<%= edit_admin_product_display_path(@product_display) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end