class AlterToAdministrators < ActiveRecord::Migration
  def self.up
    add_column :administrators, :login_no , :string
    add_column :administrators, :status , :integer
    add_column :administrators, :name , :string
    add_column :administrators, :address , :string
    add_column :administrators, :phone , :string
    add_column :administrators, :fax , :string
    add_column :administrators, :mobile , :string
    add_column :administrators, :zip , :string
    add_column :administrators, :last_login_time , :datetime
  end

  def self.down
    remove_column :administrators, :login_no
    remove_column :administrators, :status
    remove_column :administrators, :name
    remove_column :administrators, :address
    remove_column :administrators, :phone
    remove_column :administrators, :fax
    remove_column :administrators, :mobile
    remove_column :administrators, :zip
    remove_column :administrators, :last_login_time
  end
end
