class CreateTaurusProductImages < ActiveRecord::Migration
  def change
    create_table :taurus_product_images do |t|
      t.integer :product_id 

      t.boolean :is_main
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at


      t.timestamps
    end
    add_index :taurus_product_images, :product_id
  end

end
