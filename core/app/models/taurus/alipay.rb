module Taurus
	class Alipay < ActiveRecord::Base
    validates_presence_of :partner, :seller_email, :subject, :body, :on => :update

    def parameters(order,notify_url,return_url)
      { 
      	'body' => body,
      	'notify_url' => notify_url,
      	'out_trade_no' => order.number,
      	'partner' => partner,
      	'payment_type' => '1',
      	'price' => order.total_payment,
      	'quantity'=> 1.to_s,
      	'return_url'=> return_url,
        'seller_email' => seller_email,
      	'service' => 'create_direct_pay_by_user',
	      'subject' => subject,
	      '_input_charset'=> 'utf-8'
      }
    end
	end
end