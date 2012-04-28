module Taurus
  module Cms
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_cms'      
    end
  end
end
