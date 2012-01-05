class CreateRecAdds < ActiveRecord::Migration
  def self.up
    create_table :rec_adds do |t|
      t.integer :user_id
      t.string :district_no
      t.string :name
      t.string :address
      t.string :zip
      t.string :phone
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :rec_adds
  end
end
