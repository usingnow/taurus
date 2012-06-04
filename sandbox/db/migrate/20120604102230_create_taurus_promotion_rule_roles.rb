class CreateTaurusPromotionRuleRoles < ActiveRecord::Migration
  def change
    create_table :taurus_promotion_rule_roles, :force => true do |t|
	    t.integer :promotion_rule_id
	    t.integer :role_id

	    t.timestamps
	  end
	  add_index :taurus_promotion_rule_roles, :promotion_rule_id
	  add_index :taurus_promotion_rule_roles, :role_id
  end
end