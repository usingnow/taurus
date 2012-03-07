class AlterUsersAndPersonExtendsAndCompanyExtends < ActiveRecord::Migration
  def up
    remove_column :person_extends, :email
    remove_column :company_extends, :email
    add_index :users, :email, :unique => true
  end

  def down
    add_column :person_extends, :email, :string
    add_column :company_extends, :email, :string
    remove_index :users, :email
  end
end
