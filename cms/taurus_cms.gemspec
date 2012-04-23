# encoding: UTF-8
version = File.read(File.expand_path("../../TAURUS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'taurus_cms'
  s.version     = version
  s.summary     = 'Promotion functionality for use with Spree.'
  s.description = 'Required dependency for Spree'

  s.required_ruby_version = '>= 1.8.7'
  s.author      = 'David North'
  s.email       = 'david@spreecommerce.com'
  s.homepage    = 'http://spreecommerce.com'

  s.files        = Dir['README', 'LICENSE', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
end