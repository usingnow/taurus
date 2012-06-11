Deface::Override.new(:virtual_path => "taurus/admin/skus/index",
                     :name => "auth_sku_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::Sku %>
	  <a href=\"<%= new_admin_sku_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/sku')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/skus/index",
                     :name => "auth_sku_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::Sku %>
	  <a href=\"<%= edit_admin_sku_path(sku) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/skus/index",
                     :name => "auth_sku_index_clone",
                     :replace => ".clone_tag") do
  "<% if can? :manage, Taurus::Sku %>
    <a href=\"<%= clone_admin_sku_path(sku) %>\" 
       class=\"btn btn-primary trk-btn-short clone_tag\">
      <%= t('admin.misc.clone') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/skus/show",
                     :name => "auth_sku_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::Sku %>
	  <a href=\"<%= edit_admin_sku_path(@sku) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end