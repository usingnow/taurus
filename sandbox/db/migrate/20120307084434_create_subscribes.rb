class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :email

      t.timestamps
    end

    add_index :subscribes, :email, :unique => true
  end
end
