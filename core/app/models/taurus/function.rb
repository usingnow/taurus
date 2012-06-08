module Taurus
	class Function

		def self.all
			data = []
			['Core', 'Auth', 'Warehouse', 'Cms'].map do |engine|
				if defined?(eval("Taurus::#{engine}"))
					file_path = eval("Taurus::#{engine}::Engine.root") + "lib/taurus/data/functions.yml"
        	data += YAML.load(ERB.new(File.read(file_path)).result)
			  end
			end
			data
		end	

		def self.component(id)
			Function.all.find { |c| c["id"] == id }
		end

		def self.display
      Function.all.find_all { |c| c["display"] == true } || []
		end

		def self.permissions(operation_id)
			result = []
      Function.all.each do |com|
        com["functions"].each do |fun|
          fun["operations"].each do |oper|
            result += oper["permissions"] if oper["id"] == operation_id
          end
        end
      end
      result 
		end	
	end
end