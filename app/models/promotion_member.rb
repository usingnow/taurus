class PromotionMember < ActiveRecord::Base
  belongs_to :online_promotion
  belongs_to :role, :class_name => "Role", :foreign_key => "member_info"
  belongs_to :user, :class_name => "User", :foreign_key => "member_info"
end
