class PickUp < ActiveRecord::Base
  has_attached_file :image,
                    :url  => "/assets/pick_ups/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/assets/pick_ups/:id/:style_:basename.:extension"
end
