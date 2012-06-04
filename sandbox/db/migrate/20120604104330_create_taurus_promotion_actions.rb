class CreateTaurusPromotionActions < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_actions, :force => true do |t|
	    t.integer :promotion_id
	    t.string :action_type
	    t.decimal :discount, :precision => 3, :scale => 2, :default => 1
	    t.integer :points, :default => 0
	    t.boolean :free_shipping

	    t.timestamps
	  end
	  add_index :taurus_promotion_actions, :promotion_id
  end
end