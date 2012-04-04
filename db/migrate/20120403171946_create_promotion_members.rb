class CreatePromotionMembers < ActiveRecord::Migration
  def change
    create_table :promotion_members do |t|
      t.integer :online_promotion_id
      t.integer :member_info

      t.timestamps
    end
    add_index :promotion_members, :online_promotion_id
    add_index :promotion_members, :member_info
  end
end
