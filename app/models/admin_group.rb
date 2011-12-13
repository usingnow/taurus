class AdminGroup < ActiveRecord::Base

  validates :group_no, :group_name, :presence => true

  scope :match_value, lambda {|column, value|
  return {} if value.blank?
    { :conditions => ["#{column} like ?", "%#{value}%"] }
  }
  #排序构建
  scope :column_order, lambda { |key_part1,key_part2|
    {:order => key_part1.to_s+" "+ key_part2.to_s
    }
  }
end
