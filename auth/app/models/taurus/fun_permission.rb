module Taurus
	class FunPermission < ActiveRecord::Base
	  belongs_to :group
	  
	  def permissions
      Function.permissions(operation_id)
	  end
	end
end