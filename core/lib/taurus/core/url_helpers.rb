module Taurus
  module Core
    module UrlHelpers
      def taurus
        Taurus::Core::Engine.routes.url_helpers
      end
    end
  end
end
