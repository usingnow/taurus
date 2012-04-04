class AddIndexToCompanyExtendsAndPersonExtends < ActiveRecord::Migration
  def self.up
    add_index :company_extends, :user_id
    add_index :person_extends, :user_id
  end

  def self.down
    remove_index :company_extends, :user_id
    remove_index :person_extends, :user_id
  end
end
