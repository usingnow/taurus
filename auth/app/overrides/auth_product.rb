Deface::Override.new(:virtual_path => "taurus/admin/products/index",
                     :name => "auth_product_index_create",
                     :surround => ".create_tag") do
  "<% if can? :create, Taurus::Product %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/products/index",
                     :name => "auth_product_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::Product %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/shared/_product_tabs",
                     :name => "auth_product_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::Product %><%= render_original %><% end %>"                    	
end