module Taurus
  module Auth
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_auth'
    end
  end
end