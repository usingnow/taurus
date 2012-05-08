module Taurus
	module AdministratorsHelper
		def format_admin_status(value)
			Administrator::STATUS[value]
		end
	end
end