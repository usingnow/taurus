class DropPanicBuyings < ActiveRecord::Migration
  def up
     drop_table :panic_buyings
  end

  def down
    create_table :panic_buyings do |t|
      t.string :name
      t.string :href
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

    end
  end
end
