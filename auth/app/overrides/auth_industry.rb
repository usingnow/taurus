Deface::Override.new(:virtual_path => "taurus/admin/industries/index",
                     :name => "auth_industry_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Industry %>
	  <a href=\"<%= new_admin_industry_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/industry')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/industries/index",
                     :name => "auth_industry_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Industry %>
	  <a href=\"<%= edit_admin_industry_path(industry) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end
