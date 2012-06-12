Deface::Override.new(:virtual_path => "taurus/admin/roles/index",
                     :name => "auth_role_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Role %>
	  <a href=\"<%= new_admin_role_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/role')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/roles/index",
                     :name => "auth_role_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Role %>
	  <a href=\"<%= edit_admin_role_path(role) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end
