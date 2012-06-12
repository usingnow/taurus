Deface::Override.new(:virtual_path => "taurus/admin/replenishment_records/index",
                     :name => "auth_replenishment_record_index_create",
                     :replace => "#create_tag") do
  "<% if can? :create, Taurus::ReplenishmentRecord %>
	  <a href=\"<%= new_admin_replenishment_record_path %>\" class=\"btn btn-primary\" id=\"create_tag\">
	    <i class=\"icon-plus-sign\"></i>
	    <%= t('admin.actions.new.title',:model => t('activerecord.models.taurus/replenishment_record')) %>
	  </a>
  <% end %>"                    	
end
