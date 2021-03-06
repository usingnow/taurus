#encoding:UTF-8
module Taurus
	module OrdersHelper
		def format_receipt_type(receipt_type)
      OrderPayment::RECEIPT_TYPE[receipt_type]
		end

    # 后台订单操作
		def order_operations(order, html_class = "")
			buttons = '' 
			
			if order.state != "completed" && order.state != "canceled"
        buttons << link_to(I18n.t('admin.actions.edit.menu'), edit_admin_order_path(order), 
	        	               :class => "btn btn-primary " + html_class)
			end

      order.state_events.each do |event|
      	buttons << " "
      	if event == :confirm_online_payment
          buttons << (
		      	link_to format_order_enent(event), "##{order.id}", :class => "confirm-modal btn btn-primary " + html_class
		      )
      	elsif event == :product_delivery	
	      	buttons << (
		      	link_to format_order_enent(event), new_admin_order_delivery_record_path(:order_id => order), 
		        	      :class => "btn btn-primary " + html_class
		      )
		    elsif event == :sign
		    	buttons << (
		      	link_to format_order_enent(event), eval("#{event.to_s}_admin_order_path(order)"), :confirm => "请再次确认客户已签收商品？",
		                :class => "btn btn-primary " + html_class
		      )
      	elsif event != :online_payment
	        buttons << (
	        	link_to format_order_enent(event), eval("#{event.to_s}_admin_order_path(order)"), 
	        	        :class => "btn btn-primary " + html_class
	      	)
      	end
      end
      buttons.html_safe
		end
    
    # 前台订单操作
		def order_customer_operations(order, html_class = "")
      buttons = ''
      
      order.state_events.each do |event|
      	if event == :online_payment
	        buttons << (
	        	link_to format_order_enent(event), eval("#{event.to_s}_index_order_path(order)"), 
	        	        :class => "btn btn-primary #{html_class}"
	      	)
      	end

      	if event != :sign && event != :cancel
          buttons << (
	        	link_to format_order_enent(:cancel), cancel_index_order_path(order), 
	        	        :class => "btn btn-primary #{html_class}", :method => :delete,
	        	        :confirm => "确定取消订单么？"
	      	)
      	end
      end
      buttons.html_safe
		end

		def format_order_enent(event)
      Order::EVENT[event]
		end

		def format_order_state(state)
      Order::STATE[state]
		end
	end
end