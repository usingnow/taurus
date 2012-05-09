class CreateTaurusPersonExtends < ActiveRecord::Migration
  def change
    create_table :taurus_person_extends do |t|
      t.string :number
      t.string :name
      t.integer :sex
      t.date :birth
      t.integer :district_id
      t.string :phone
      t.string :address
      t.string :zip_code
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
    add_index :taurus_person_extends, :district_id
    add_index :taurus_person_extends, :created_by
    add_index :taurus_person_extends, :updated_by
  end
end
