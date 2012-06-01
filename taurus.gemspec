# encoding: UTF-8
version = File.read(File.expand_path("../TAURUS_VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'taurus'
  s.version     = version
  s.summary     = ''
  s.description = ''

  s.files        = Dir['README.md', 'lib/**/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.required_ruby_version     = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"

  s.author       = ''
  s.email        = ''
  s.homepage     = ''

  s.add_dependency 'taurus_core', version
  s.add_dependency 'taurus_cms', version
  s.add_dependency 'taurus_auth', version
  s.add_dependency 'taurus_warehouse', version
  s.add_dependency 'taurus_sample', version
  s.add_dependency 'taurus_promo', version
end
