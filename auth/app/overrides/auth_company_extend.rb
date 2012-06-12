Deface::Override.new(:virtual_path => "taurus/admin/company_extends/index",
                     :name => "auth_company_extend_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::CompanyExtend %>
	  <a href=\"<%= new_admin_company_extend_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/company_extend')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_extends/index",
                     :name => "auth_company_extend_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::CompanyExtend %>
	  <a href=\"<%= edit_admin_company_extend_path(company_extend) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/company_extends/show",
                     :name => "auth_company_extend_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::CompanyExtend %>
	  <a href=\"<%= edit_admin_company_extend_path(@company_extend) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end