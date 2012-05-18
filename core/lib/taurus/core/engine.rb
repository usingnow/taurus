module Taurus
  module Core
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_core'
      
      config.autoload_paths += %W(#{config.root}/lib)
     
      config.after_initialize do
        Rails.application.routes_reloader.reload!
      end
    end
  end
end
