Deface::Override.new(:virtual_path => "taurus/admin/company_extends/index",
                     :name => "auth_company_extend_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::CompanyExtend %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_extends/index",
                     :name => "auth_company_extend_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::CompanyExtend %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_extends/show",
                     :name => "auth_company_extend_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::CompanyExtend %><%= render_original %><% end %>"                    	
end