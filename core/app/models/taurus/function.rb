module Taurus
	class Function
		def self.all
			data = []
			data += YAML.load(File.open(Taurus::Warehouse::Engine.root+"lib/taurus/data/functions.yml"))
			data += YAML.load(File.open(Taurus::Auth::Engine.root+"lib/taurus/data/functions.yml"))
			data += YAML.load(File.open(Taurus::Core::Engine.root+"lib/taurus/data/functions.yml"))
			data += YAML.load(File.open(Taurus::Cms::Engine.root+"lib/taurus/data/functions.yml"))
			data
		end	
	end
end