class SliderBar < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/assets/slider_bars/:id.:extension",
                    :path => ":rails_root/public/assets/slider_bars/:id.:extension"
end
