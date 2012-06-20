Deface::Override.new(:virtual_path => "taurus/admin/industries/index",
                     :name => "auth_industry_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::Industry %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/industries/index",
                     :name => "auth_industry_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::Industry %><%= render_original %><% end %>"                    	
end
