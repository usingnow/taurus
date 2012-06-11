module Taurus
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_auth'

      def self.activate
        Dir.glob(File.join(File.dirname(__FILE__), "../../../app/**/*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      config.to_prepare &method(:activate).to_proc

    end
  end
end