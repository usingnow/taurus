module Taurus
	class AdministratorGroupLineItem < ActiveRecord::Base
		belongs_to :administrator
		belongs_to :group
	end
end