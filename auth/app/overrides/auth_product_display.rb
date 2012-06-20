Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::ProductDisplay %>
	  <a href=\"<%= new_admin_product_display_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/product_display')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::ProductDisplay %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/product_displays/index",
                     :name => "auth_product_display_index_destroy",
                     :surround => ".destroy_tag") do
  "<% if can? :destroy, Taurus::ProductDisplay %><%= render_original %><% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/product_displays/show",
                     :name => "auth_product_display_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::ProductDisplay %><%= render_original %><% end %>"                    	
end