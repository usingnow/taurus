module Taurus
  module Core
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_core'

      
    end
  end
end
