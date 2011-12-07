class AdminGroup < ActiveRecord::Base
  validates :group_no, :group_name, :presence => true
end
