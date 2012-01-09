class CreateUserNumbers < ActiveRecord::Migration
  def self.up
    create_table :user_numbers do |t|
      t.integer :person_no
      t.integer :company_no

      t.timestamps
    end
  end

  def self.down
    drop_table :user_numbers
  end
end
