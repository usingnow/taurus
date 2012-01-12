class PanicBuying < ActiveRecord::Base
  has_attached_file :image,
                   :url  => "/assets/panic_buyings/:id_:basename.:extension",
                   :path => ":rails_root/public/assets/panic_buyings/:id_:basename.:extension"

  validates_presence_of :name, :href
  validates_attachment_presence :image
end
