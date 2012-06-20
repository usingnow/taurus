Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::Group %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::Group %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_destroy",
                     :surround => ".destroy_tag") do
  "<% if can? :destroy, Taurus::Group %><%= render_original %><% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/show",
                     :name => "auth_group_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::Group %><%= render_original %><% end %>"                    	
end