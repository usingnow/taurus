module Taurus
  module Warehouse
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_warehouse'      
    end
  end
end
