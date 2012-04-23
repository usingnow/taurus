module Commodity::Admin::SkuDisplaysHelper

  def sum_sku_display_location_skus(page, location)
    SkuDisplay.count(:conditions => "page = #{page} and location = #{location}")
  end

  def sku_display_page_buttons
    html = ''
    yaml_data.each do |page|
      html += content_tag(:button, page['name'], :value => page['id'], :type => "button",  :class => "page_button")
    end
    html.html_safe
  end

  private
    def yaml_data
      YAML.load(File.open(Rails.root+"lib/data/sku_display.yml"))
    end
end