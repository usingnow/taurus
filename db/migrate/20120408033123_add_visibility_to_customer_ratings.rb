class AddVisibilityToCustomerRatings < ActiveRecord::Migration
  def change
    add_column :customer_ratings, :visibility, :boolean, :default => true
  end
end
