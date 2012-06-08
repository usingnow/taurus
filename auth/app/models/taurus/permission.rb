module Taurus
	class Permission < ActiveRecord::Base
	  belongs_to :permissionable, :polymorphic => true
	  
	end
end
