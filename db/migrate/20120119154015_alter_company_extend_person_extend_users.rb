class AlterCompanyExtendPersonExtendUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :role_id, :integer
    execute("update users t1,company_extends t2 set t1.role_id = t2.role_id where t1.id = t2.user_id" )
    execute("update users t1,person_extends t2 set t1.role_id = t2.role_id where t1.id = t2.user_id" )
    remove_column :company_extends, :role_no
    remove_column :company_extends, :role_id
    remove_column :person_extends, :role_no
    remove_column :person_extends, :role_id
  end

  def self.down
    add_column :company_extends, :role_no, :string
    add_column :company_extends, :role_id, :integer
    add_column :person_extends, :role_no, :string
    add_column :person_extends, :role_id, :integer
    execute("update users t1,company_extends t2 set t2.role_id = t1.role_id where t1.id = t2.user_id" )
    execute("update users t1,person_extends t2 set t2.role_id = t1.role_id where t1.id = t2.user_id" )
    remove_column :users, :role_id
  end
end
