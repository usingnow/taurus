class CreateEscs < ActiveRecord::Migration
  def self.up
    create_table :escs do |t|
      t.string :number
      t.integer :esc_category_id
      t.integer :user_id
      t.integer :status
      t.integer :order_id
      t.string :not_registration_user_info
      t.string :user_other_info
      t.string :title
      t.text :description
      t.integer :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :escs
  end
end
