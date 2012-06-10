module Taurus
	class Group < ActiveRecord::Base
		has_many :fun_permissions
		has_many :administrator_group_line_items
		has_many :administrators, :through => :administrator_group_line_items
    
    before_destroy :destroy_validate

	  validates_presence_of :name

	  protected
	  def destroy_validate
      [:administrators, :fun_permissions].map do |relation|
        return false if self.send(relation).size > 0
      end   
    end 
	end
end