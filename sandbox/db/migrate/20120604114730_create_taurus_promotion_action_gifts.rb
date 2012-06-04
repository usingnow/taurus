class CreateTaurusPromotionActionGifts < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_action_gifts, :force => true do |t|
	    t.integer :promotion_action_id
	    t.integer :product_id

	    t.timestamps
	  end
	  add_index :taurus_promotion_action_gifts, :promotion_action_id
	  add_index :taurus_promotion_action_gifts, :product_id
  end
end