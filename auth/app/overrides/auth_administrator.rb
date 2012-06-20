Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::Administrator %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::Administrator %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_group",
                     :surround => ".group_tag") do
  "<% if can? :manage, Taurus::AdministratorGroupLineItem %><%= render_original %><% end %>"                      
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/show",
                     :name => "auth_administrator_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::Administrator %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/show",
                     :name => "auth_administrator_show_group",
                     :surround => "#group_tag") do
  "<% if can? :manage, Taurus::AdministratorGroupLineItem %><%= render_original %><% end %>"                      
end