class CustomerRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  belongs_to :administrator

  validates_presence_of :user_id, :sku_id, :rating, :comment
end
