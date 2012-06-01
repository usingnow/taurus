module Taurus
	class Function
		def self.all
			data = []
			data += YAML.load(File.open(Taurus::Warehouse::Engine.root+"lib/taurus/data/functions.yml")) if defined?(Taurus::Warehouse)
			data += YAML.load(File.open(Taurus::Auth::Engine.root+"lib/taurus/data/functions.yml")) if defined?(Taurus::Auth)
			data += YAML.load(File.open(Taurus::Core::Engine.root+"lib/taurus/data/functions.yml")) if defined?(Taurus::Core)
			data += YAML.load(File.open(Taurus::Cms::Engine.root+"lib/taurus/data/functions.yml")) if defined?(Taurus::Cms)
			data += YAML.load(File.open(Taurus::Promo::Engine.root+"lib/taurus/data/functions.yml")) if defined?(Taurus::Promo)
			data
		end	

		def self.component(id)
			Function.all.find { |c| c["id"] == id }
		end	
	end
end