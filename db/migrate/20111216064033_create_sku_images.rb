class CreateSkuImages < ActiveRecord::Migration
  def self.up
    create_table :sku_images do |t|
      t.integer :sku_id
      t.string :name
      t.string :image_url
      t.text :image_description
      t.integer :sort
      t.boolean :is_main
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :sku_images
  end
end
