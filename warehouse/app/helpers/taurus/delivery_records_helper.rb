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
	end
end