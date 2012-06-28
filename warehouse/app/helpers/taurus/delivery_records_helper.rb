module Taurus
	module DeliveryRecordsHelper
    def error_messages(object)
      errors = ''
      if object.errors.any?
        message = ''
      	object.errors.full_messages.each do |msg|
        	message << msg[7, msg.length] + "<br />" if msg.start_with?("$stock")
      	end
        errors = content_tag :div, message.html_safe, :class => "alert alert-error" unless message.blank?
      end
      errors.html_safe
    end

    def format_delivery_record_type(type)
      DeliveryRecord::DELIVERY_RECORD_TYPE[type]
    end

    def format_delivery_type(type)
      DeliveryRecord::DELIVERY_TYPE[type]
    end
	end
end