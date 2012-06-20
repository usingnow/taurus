Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_create",
                     :surround => "#create_tag") do
  "<% if can? :create, Taurus::SliderBar %><%= render_original %><% end %>"                    	
end


Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_update",
                     :surround => ".update_tag") do
  "<% if can? :update, Taurus::SliderBar %><%= render_original %><% end %>"                    	
end

Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/index",
                     :name => "auth_slider_bar_index_destroy",
                     :surround => ".destroy_tag") do
  "<% if can? :destroy, Taurus::SliderBar %><%= render_original %><% end %>"                      
end


Deface::Override.new(:virtual_path => "taurus/admin/slider_bars/show",
                     :name => "auth_slider_bar_show_update",
                     :surround => "#update_tag") do
  "<% if can? :update, Taurus::SliderBar %><%= render_original %><% end %>"                    	
end