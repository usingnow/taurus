Deface::Override.new(:virtual_path => "taurus/admin/company_types/index",
                     :name => "auth_company_type_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::CompanyType %>
	  <a href=\"<%= new_admin_company_type_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/company_type')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_types/index",
                     :name => "auth_company_type_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::CompanyType %>
	  <a href=\"<%= edit_admin_company_type_path(company_type) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end
