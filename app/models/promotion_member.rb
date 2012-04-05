#encoding:UTF-8
class PromotionMember < ActiveRecord::Base
  belongs_to :online_promotion
  belongs_to :role, :class_name => "Role", :foreign_key => "member_info"
  belongs_to :user, :class_name => "User", :foreign_key => "member_info"

  validates_presence_of :online_promotion_id, :member_info
  validate :member_info_empty?

  protected
    def member_info_empty?
      ids = PromotionMember.find_all_by_online_promotion_id_and_member_info(online_promotion_id,member_info).map(&:member_info)
      if ids.member?(member_info.to_i)
        errors.add(:member_info, "已存在")
      end
    end
end
