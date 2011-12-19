class CreateCompanyExtends < ActiveRecord::Migration
  def self.up
    create_table :company_extends do |t|
      t.integer :user_id
      t.string :company_no
      t.string :role_no
      t.integer :industry_type_id
      t.integer :company_type_id
      t.string :district_no
      t.integer :company_scale_id
      t.string :email
      t.string :company_name
      t.string :contact_dept
      t.string :contact_post
      t.string :web_address
      t.integer :sex
      t.string :name
      t.string :address
      t.string :phone
      t.string :fax
      t.string :mobile
      t.string :zip
      t.string :created_by
      t.string :updated_by

      t.timestamps
    end
  end

  def self.down
    drop_table :company_extends
  end
end
