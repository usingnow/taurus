Deface::Override.new(:virtual_path => "taurus/admin/replenishment_records/index",
                     :name => "auth_replenishment_record_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::ReplenishmentRecord %><%= render_original %><% end %>"                    	
end
