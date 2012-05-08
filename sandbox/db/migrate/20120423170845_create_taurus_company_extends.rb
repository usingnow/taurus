class CreateTaurusCompanyExtends < ActiveRecord::Migration
  def change
    create_table :taurus_company_extends do |t|
      t.string :number
      t.string :name

      t.string :web_address
      t.integer :taurus_industry_id
      t.integer :taurus_company_type_id
      t.integer :taurus_company_scale_id
      t.integer :taurus_district_id
      t.string :address
      t.string :phone
      t.string :fax
      t.string :zip_code
       
      t.string :contact_name 
      t.string :contact_dept
      t.string :contact_post
      t.string :contact_mobile
      t.integer :contact_sex
      
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end

    add_index :taurus_company_extends, :taurus_industry_id
    add_index :taurus_company_extends, :taurus_company_type_id
    add_index :taurus_company_extends, :taurus_company_scale_id
    add_index :taurus_company_extends, :taurus_district_id
    add_index :taurus_company_extends, :created_by
    add_index :taurus_company_extends, :updated_by
  end
end
