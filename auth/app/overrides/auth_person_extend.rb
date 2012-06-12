Deface::Override.new(:virtual_path => "taurus/admin/person_extends/index",
                     :name => "auth_person_extend_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::PersonExtend %>
	  <a href=\"<%= new_admin_person_extend_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/person_extend')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/person_extends/index",
                     :name => "auth_person_extend_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::PersonExtend %>
	  <a href=\"<%= edit_admin_person_extend_path(person_extend) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/person_extends/show",
                     :name => "auth_person_extend_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::PersonExtend %>
	  <a href=\"<%= edit_admin_person_extend_path(@person_extend) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end