module Taurus
	module Index
		class HomeController < BaseController
			def index
=begin
        datas = Supplier.all
        File.open(Rails.root.to_s + '/public/suppliers.yml', 'w') { |f|  
	        datas.each_with_index do |data,index|
	        	f.puts "suppliers_#{index+1}:"
	        	f.puts "  id: #{data.id}"
	        	f.puts "  number: '#{data.number}'"
	        	f.puts "  name: '#{data.name}'" 
	        	f.puts "  contact_name: '#{data.contact_name}'" 
	        	f.puts "  contact_phone: '#{data.contact_phone}'"
            f.puts "  terms_of_exchange: '#{data.terms_of_exchange}'"
            f.puts "  delivery: '#{data.delivery}'"
            f.puts "  level: '#{data.level}'"
            f.puts "  status: #{data.status}"
            f.puts "  created_by: 1"
            f.puts "  updated_by: 1"
	        end
	      }  
			end
=end
		end
	end	
end