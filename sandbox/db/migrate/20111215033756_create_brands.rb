class CreateBrands < ActiveRecord::Migration
  def self.up
    create_table :brands do |t|
      t.string :chinese_name
      t.string :english_name
      t.string :pinyin
      t.string :web_address
      t.string :image_url
      t.boolean :active
      t.string :create_by
      t.string :update_by
      t.string :company_name
      t.text :company_introduction

      t.timestamps
    end
  end

  def self.down
    drop_table :brands
  end
end
