#encoding:UTF-8
module Taurus
  class SkuDisplay < ActiveRecord::Base
    belongs_to :sku

    def self.index_display(options={})
      Sku.order("sku_displays.sequence desc").limit(options[:limit]).on_shelves.
          joins("inner join sku_displays on skus.id = sku_displays.sku_id").
          where("sku_displays.page = ? and sku_displays.location = ?", options[:page], options[:location])
    end


    validates_presence_of :sku_id, :sequence, :page, :location
    validate :sku_id_unique?, :max_count?

    protected
      def sku_id_unique?
        sku_displays = SkuDisplay.find_all_by_page_and_location_and_sku_id(page,location,sku_id)
        errors.add(:sku_id, "已存在") if sku_displays.any?
      end

      def max_count?
        data = YAML.load(File.open(Rails.root+"lib/data/sku_display.yml"))
        max_count = data.find { |d| d['id'].to_s == page.to_s }['locations'].find { |l| l['id'].to_s == location.to_s }['size']
        current_count = SkuDisplay.count(:conditions => "page = #{page} and location = #{location}")
        errors.add('商品数量', "已到最大限度") if current_count >= max_count
      end
  end
end
