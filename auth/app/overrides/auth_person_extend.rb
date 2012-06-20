Deface::Override.new(:virtual_path => "taurus/admin/person_extends/index",
                     :name => "auth_person_extend_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::PersonExtend %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/person_extends/index",
                     :name => "auth_person_extend_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::PersonExtend %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/person_extends/show",
                     :name => "auth_person_extend_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::PersonExtend %><%= render_original %><% end %>"                    	
end