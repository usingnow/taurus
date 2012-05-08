class RemoveImageUrlToBrand < ActiveRecord::Migration
  def self.up
    remove_column :brands, :image_url
  end

  def self.down
    add_column :brands, :image_url, :string
  end
end
