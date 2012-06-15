module Taurus
  module Index
    class UserSessionsController < Devise::SessionsController
      layout '/taurus/layouts/index'
      
    end
  end
end
