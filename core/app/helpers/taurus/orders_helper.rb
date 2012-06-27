#encoding:UTF-8
module Taurus
	module OrdersHelper
		def format_receipt_type(receipt_type)
      OrderPayment::RECEIPT_TYPE[receipt_type]
		end

		def format_order_state(state)
      Order::STATE[state]
		end

		def order_operations(order, html_class = "")
			buttons = ''
      order.state_events.each do |event|
      	if event != :online_payment && event != :sign && event != :product_delivery
	        buttons << (
	        	link_to format_order_enent(event), eval("#{event.to_s}_admin_order_path(order)"), 
	        	        :class => "btn btn-primary " + html_class
	      	)
	      elsif event == :product_delivery	
	      	buttons << (
		      	link_to format_order_enent(event), new_admin_order_delivery_record_path(:order_id => order), 
		        	      :class => "btn btn-primary " + html_class, :target => "_blank"
		      )  	      
      	end
      end
      buttons.html_safe
		end

		def order_customer_operations(order)
      buttons = ''
      order.state_events.each do |event|
      	if event == :online_payment || event == :sign
	        buttons << (
	        	link_to format_order_enent(event), eval("#{event.to_s}_index_order_path(order)"), 
	        	        :class => "btn btn-primary trk-btn-short"
	      	)
      	end
      end
      buttons.html_safe
		end

		def format_order_enent(event)
      Order::EVENT[event]
		end
	end
end