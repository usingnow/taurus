class CreateTaurusPromotionActionProducts < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_action_products, :force => true do |t|
	    t.integer :promotion_action_id
	    t.integer :product_id

	    t.timestamps
	  end
	  add_index :taurus_promotion_action_products, :promotion_action_id
	  add_index :taurus_promotion_action_products, :product_id
  end
end