class CreatePromotionMemberTemps < ActiveRecord::Migration
  def change
    create_table :promotion_member_temps do |t|
      t.integer :member_type
      t.integer :member_info
      t.integer :administrator_id

      t.timestamps
    end
    add_index :promotion_member_temps, :member_info
    add_index :promotion_member_temps, :administrator_id
  end
end
