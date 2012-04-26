#encoding:UTF-8
class PromotionMemberTemp < ActiveRecord::Base
  belongs_to :administrator
  belongs_to :role, :class_name => "Role", :foreign_key => "member_info"
  belongs_to :user, :class_name => "User", :foreign_key => "member_info"

  validates_presence_of :member_type, :member_info, :administrator_id
  validate :member_info_empty?

  protected
    def member_info_empty?
      ids = PromotionMemberTemp.find_all_by_administrator_id_and_member_type(administrator_id,member_type).map(&:member_info)
      if ids.member?(member_info.to_i)
        errors.add(:member_info, "已存在")
      end
    end
end
