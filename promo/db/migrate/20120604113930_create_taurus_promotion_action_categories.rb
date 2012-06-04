class CreateTaurusPromotionActionCategories < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_action_categories, :force => true do |t|
	    t.integer :promotion_action_id
	    t.integer :product_category_id

	    t.timestamps
	  end
	  add_index :taurus_promotion_action_categories, :promotion_action_id
	  add_index :taurus_promotion_action_categories, :product_category_id
  end
end