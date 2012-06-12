Deface::Override.new(:virtual_path => "taurus/admin/suppliers/index",
                     :name => "auth_supplier_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Supplier %>
	  <a href=\"<%= new_admin_supplier_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/supplier')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/suppliers/index",
                     :name => "auth_supplier_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Supplier %>
	  <a href=\"<%= edit_admin_supplier_path(supplier) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/suppliers/index",
                     :name => "auth_supplier_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :destroy, Taurus::Supplier %>
    <a href=\"<%= admin_supplier_path(supplier) %>\" class=\"btn btn-danger trk-btn-short destroy_tag\"
       data-method=\"delete\" data-confirm=\"<%= t('admin.actions.delete.confirm') %>\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/suppliers/show",
                     :name => "auth_supplier_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Supplier %>
	  <a href=\"<%= edit_admin_supplier_path(@supplier) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/suppliers/show",
                     :name => "auth_supplier_show_destroy",
                     :replace => "#destroy_tag") do
  "<% if can? :destroy, Taurus::Supplier %>
    <a href=\"<%= admin_supplier_path(@supplier) %>\" class=\"btn btn-danger\" id=\"destroy_tag\"
       data-method=\"delete\" data-confirm=\"<%= t('admin.actions.delete.confirm') %>\">
      <i class=\"icon-remove-sign\"></i>
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end