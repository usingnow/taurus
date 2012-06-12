Deface::Override.new(:virtual_path => "taurus/admin/brands/index",
                     :name => "auth_brand_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Brand %>
	  <a href=\"<%= new_admin_brand_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/brand')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/brands/index",
                     :name => "auth_brand_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Brand %>
	  <a href=\"<%= edit_admin_brand_path(brand) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/brands/index",
                     :name => "auth_brand_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :destroy, Taurus::Brand %>
    <a href=\"<%= admin_brand_path(brand) %>\" class=\"btn btn-danger trk-btn-short destroy_tag\"
       data-method=\"delete\" data-confirm=\"<%= t('admin.actions.delete.confirm') %>\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/brands/show",
                     :name => "auth_brand_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Brand %>
	  <a href=\"<%= edit_admin_brand_path(@brand) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/brands/show",
                     :name => "auth_brand_show_destroy",
                     :replace => "#destroy_tag") do
  "<% if can? :destroy, Taurus::Brand %>
    <a href=\"<%= admin_brand_path(@brand) %>\" class=\"btn btn-danger\" id=\"destroy_tag\"
       data-method=\"delete\" data-confirm=\"<%= t('admin.actions.delete.confirm') %>\">
      <i class=\"icon-remove-sign\"></i>
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end