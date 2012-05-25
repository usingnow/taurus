module Taurus
	class Alipay < ActiveRecord::Base
    validates_presence_of :partner, :seller_email, :subject, :body, :on => :update
	end
end