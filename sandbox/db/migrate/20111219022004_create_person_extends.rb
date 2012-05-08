class CreatePersonExtends < ActiveRecord::Migration
  def self.up
    create_table :person_extends do |t|
      t.integer :user_id
      t.string :person_no
      t.string :role_no
      t.string :email
      t.string :name
      t.integer :sex
      t.date :birth
      t.string :district_no
      t.string :phone
      t.string :address
      t.string :post
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :person_extends
  end
end
