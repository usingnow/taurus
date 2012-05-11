# encoding: UTF-8
version = File.read(File.expand_path("../../TAURUS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'taurus_auth'
  s.version     = version
  s.summary     = ''
  s.description = ''

  s.required_ruby_version = '>= 1.8.7'
  s.author      = ''
  s.email       = ''
  s.homepage    = ''

  s.files        = Dir['README', 'LICENSE', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'taurus_core', version
  s.add_dependency 'devise', '~> 2.0'
  s.add_dependency 'cancan', '1.6.7'
end