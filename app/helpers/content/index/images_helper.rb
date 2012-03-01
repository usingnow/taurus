module Content::Index::ImagesHelper
  def image_cms(method,options={})
    object = @images.find { |i| i.location == method }
    unless object.nil?
      if object.line_type == 1
        href = object.href
      else
        href = content_index_image_path(object.id)
      end

      link_to (image_tag object.image.url, options), href
    end
  end
end