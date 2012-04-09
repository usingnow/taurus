class CreatePromotionPriorities < ActiveRecord::Migration
  def change
    create_table :promotion_priorities do |t|
      t.integer :promotion_high
      t.integer :promotion_low

      t.timestamps
    end
    add_index :promotion_priorities, :promotion_high
    add_index :promotion_priorities, :promotion_low
  end
end
