class CustomerRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :sku
  belongs_to :administrator

  attr_accessor :current_action

  validates_presence_of :user_id, :sku_id, :rating, :comment
  validates_presence_of :administrator_id, :reply, :if => Proc.new { current_action == "reply" }

end
