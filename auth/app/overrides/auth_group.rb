Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Group %>
	  <a href=\"<%= new_admin_group_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/group')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Group %>
	  <a href=\"<%= edit_admin_group_path(group) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/index",
                     :name => "auth_group_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :destroy, Taurus::Group %>
    <a href=\"<%= admin_group_path(group) %>\" data-method=\"delete\"
      data-confirm=\"<%= t('admin.actions.delete.confirm') %>\" 
       class=\"btn btn-primary trk-btn-short destroy_tag\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/groups/show",
                     :name => "auth_group_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Group %>
	  <a href=\"<%= edit_admin_group_path(@group) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end