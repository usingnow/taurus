module Taurus
	class FunPermission < ActiveRecord::Base
	  belongs_to :group
	  has_many :permissions, :as => :permissionable, :dependent => :destroy

	end
end
