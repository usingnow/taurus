# encoding: UTF-8
version = File.read(File.expand_path("../../TAURUS_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'taurus_core'
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

  s.add_dependency 'rails', '3.2.2'
  s.add_dependency 'jquery-rails', '1.0.19'
  s.add_dependency 'ckeditor', '3.7.1'
  s.add_dependency 'paperclip', '2.4.0'
  s.add_dependency 'rmagick', '2.13.1' 
  s.add_dependency 'will_paginate', '3.0.3' 
  s.add_dependency 'ransack'
  s.add_dependency 'simple_form', '2.0.2'
  s.add_dependency 'twitter-bootstrap-rails'
  s.add_dependency 'will_paginate-bootstrap'
  s.add_dependency 'rails3-jquery-autocomplete'
  s.add_dependency 'state_machine', '= 1.1.2'
  s.add_dependency 'deface', '>= 0.8.0'
  s.add_dependency 'font-awesome-sass-rails'
  s.add_dependency 'cells', '3.8.5'
end