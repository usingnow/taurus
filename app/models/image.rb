class Image < ActiveRecord::Base
  has_attached_file :image,
                    :url => lambda{ |l| "/paperclip_assets/images/#{l.instance.location}/:id.:extension" },
                    :path => lambda{ |l| ":rails_root/public/paperclip_assets/images/#{l.instance.location}/:id.:extension" }

  def location_enum
    {}
  end
end
