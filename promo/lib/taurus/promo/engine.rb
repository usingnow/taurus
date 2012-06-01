module Taurus
  module Promo
    class Engine < Rails::Engine
      isolate_namespace Taurus
      engine_name 'taurus_promo'      
    end
  end
end
