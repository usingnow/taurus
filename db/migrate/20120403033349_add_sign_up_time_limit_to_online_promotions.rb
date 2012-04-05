class AddSignUpTimeLimitToOnlinePromotions < ActiveRecord::Migration
  def change
    add_column :online_promotions, :sign_up_time_limit, :boolean, :default => false
  end
end
