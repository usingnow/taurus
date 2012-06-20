Deface::Override.new(:virtual_path => "taurus/admin/company_scales/index",
                     :name => "auth_company_scale_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::CompanyScale %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_scales/index",
                     :name => "auth_company_scale_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::CompanyScale %><%= render_original %><% end %>"                    	
end
