Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Administrator %>
	  <a href=\"<%= new_admin_administrator_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/administrator')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Administrator %>
	  <a href=\"<%= edit_admin_administrator_path(administrator) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/index",
                     :name => "auth_administrator_index_group",
                     :replace => ".group_tag") do
  "<% if can? :manage, Taurus::AdministratorGroupLineItem %>
    <a href=\"<%= new_admin_administrator_administrator_group_line_item_path(administrator) %>\" 
       class=\"btn btn-primary trk-btn-short group_tag\">
      <%= t('admin.actions.edit.title', :model => t('activerecord.models.taurus/group')) %>
    </a>
  <% end %>"                      
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/show",
                     :name => "auth_administrator_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Administrator %>
	  <a href=\"<%= edit_admin_administrator_path(@administrator) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/administrators/show",
                     :name => "auth_administrator_show_group",
                     :replace => "#group_tag") do
  "<% if can? :manage, Taurus::AdministratorGroupLineItem %>
    <a href=\"<%= new_admin_administrator_administrator_group_line_item_path(@administrator) %>\" class=\"btn btn-primary\" id=\"group_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.title', :model => t('activerecord.models.taurus/group')) %>
    </a>
  <% end %>"                      
end