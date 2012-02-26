class CreateMailSales < ActiveRecord::Migration
  def change
    create_table :mail_sales do |t|
      t.integer :user_id
      t.string :name
      t.string :district_no
      t.string :address
      t.string :zip
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :email

      t.timestamps
    end

    add_index :mail_sales, :user_id, :unique => true
  end
end
