class CreateTaurusImages < ActiveRecord::Migration
  def change
    create_table :taurus_images, :force => true do |t|
      t.integer  :page
      t.integer  :location
      t.text     :description
      t.integer  :line_type,          :default => 0
      t.string   :href
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
    add_index :taurus_images, :page
    add_index :taurus_images, :location
  end
end


  