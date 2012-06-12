Deface::Override.new(:virtual_path => "taurus/admin/company_scales/index",
                     :name => "auth_company_scale_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::CompanyScale %>
	  <a href=\"<%= new_admin_company_type_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/company_scale')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_scales/index",
                     :name => "auth_company_scale_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::CompanyScale %>
	  <a href=\"<%= edit_admin_company_scale_path(company_scale) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end
