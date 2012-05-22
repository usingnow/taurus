module Taurus
	module OrdersHelper
		def format_receipt_type(receipt_type)
      Taurus::OrderPayment::RECEIPT_TYPE[receipt_type]
		end
	end
end