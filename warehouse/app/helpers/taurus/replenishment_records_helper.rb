module Taurus
	module ReplenishmentRecordsHelper
    def format_replenishment_type(type)
      ReplenishmentRecord::REPLENISHMENT_TYPE[type]
    end
	end
end