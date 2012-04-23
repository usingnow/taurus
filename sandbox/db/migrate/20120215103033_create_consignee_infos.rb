class CreateConsigneeInfos < ActiveRecord::Migration
  def change
    create_table :consignee_infos do |t|
      t.integer :user_id
      t.string :name
      t.string :district_no
      t.string :address
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :zip

      t.timestamps
    end

    add_index :consignee_infos, :user_id, :unique => true
  end
end
