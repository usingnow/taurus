Rails.application.routes.draw do
  <%= 'mount Taurus::Core::Engine => "/"' if defined?(Taurus::Core) %>
end
