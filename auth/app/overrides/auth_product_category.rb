Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_create",
                     :surround => ".create_tag") do
  "<% if can? :create, Taurus::ProductCategory %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::ProductCategory %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/product_categories/index",
                     :name => "auth_product_category_index_destroy",
                     :surround => ".destroy_tag") do
  "<% if can? :destroy, Taurus::ProductCategory %><%= render_original %><% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/shared/_product_category_tabs",
                     :name => "auth_product_category_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::ProductCategory %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/shared/_product_category_tabs",
                     :name => "auth_product_category_show_destroy",
                     :surround => "#destroy_tag") do
  "<% if can? :destroy, Taurus::ProductCategory %><%= render_original %><% end %>"                      
end