Deface::Override.new(:virtual_path => "taurus/admin/roles/index",
                     :name => "auth_role_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::Role %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/roles/index",
                     :name => "auth_role_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::Role %><%= render_original %><% end %>"                    	
end
