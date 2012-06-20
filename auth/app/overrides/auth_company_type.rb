Deface::Override.new(:virtual_path => "taurus/admin/company_types/index",
                     :name => "auth_company_type_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::CompanyType %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_types/index",
                     :name => "auth_company_type_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::CompanyType %><%= render_original %><% end %>"                    	
end
