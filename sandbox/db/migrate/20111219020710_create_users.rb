class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login_no
      t.string :password
      t.integer :status
      t.integer :type
      t.string :question
      t.string :answer
      t.datetime :last_login_time

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
