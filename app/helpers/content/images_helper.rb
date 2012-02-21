#encoding:UTF-8
module Content::ImagesHelper
  def get_image_page(page)
    Image.new.page_enum[page]
  end

  def get_image_location(page, location)
    Image.new.location_enum(page)[location]
  end
end