class RemoveImageUrlToSkuImage < ActiveRecord::Migration
  def self.up
    remove_column :sku_images, :image_url
  end

  def self.down
    add_column :sku_images, :image_url, :string
  end
end
