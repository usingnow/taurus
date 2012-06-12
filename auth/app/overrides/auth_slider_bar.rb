Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::SliderBar %>
	  <a href=\"<%= new_admin_slider_bar_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/slider_bar')) %>
	  </a>
  <% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_update",
                     :replace => ".update_tag") do
  "<% if can? :update, Taurus::SliderBar %>
	  <a href=\"<%= edit_admin_slider_bar_path(slider_bar) %>\" class=\"btn btn-primary trk-btn-short update_tag\">
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_destroy",
                     :replace => ".destroy_tag") do
  "<% if can? :delete, Taurus::SliderBar %>
    <a href=\"<%= admin_slider_bar_path(slider_bar) %>\" data-method=\"delete\"
       data-confirm=\"<%= t('admin.actions.delete.confirm') %>\"
       class=\"btn btn-primary trk-btn-short destroy_tag\">
      <%= t('admin.actions.delete.menu') %>
    </a>
  <% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/show",
                     :name => "auth_slider_bar_show_update",
                     :replace => "#update_tag") do
  "<% if can? :update, Taurus::SliderBar %>
	  <a href=\"<%= edit_admin_slider_bar_path(@slider_bar) %>\" class=\"btn btn-primary\" id=\"update_tag\">
      <i class=\"icon-edit\"></i>
      <%= t('admin.actions.edit.menu') %>
    </a>
  <% end %>"                    	
end