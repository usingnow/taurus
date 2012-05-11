class CreateTaurusBrands < ActiveRecord::Migration
  def change
    create_table :taurus_brands do |t|
      t.string :chinese_name
      t.string :english_name
      t.string :pinyin
      t.string :web_address
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.string :company_name
      t.text :company_description

      t.integer :created_by
      t.integer :updated_by

      t.boolean :status

      t.timestamps
    end
  end
end
