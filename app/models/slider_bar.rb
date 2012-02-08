class SliderBar < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/paperclip_assets/slider_bars/:id.:extension",
                    :path => ":rails_root/public/paperclip_assets/slider_bars/:id.:extension"
end
