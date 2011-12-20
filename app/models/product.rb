class Product < ActiveRecord::Base
  scope :match_value, lambda {|column, value|
  return {} if value.blank?
    { :conditions => ["#{column} like ?", "%#{value}%"] }
  }
  #排序构建
  scope :column_order, lambda { |key_part1,key_part2|
    {:orders => key_part1.to_s+" "+ key_part2.to_s
    }
  }
end
