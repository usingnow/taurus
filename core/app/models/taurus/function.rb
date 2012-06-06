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
	end
end