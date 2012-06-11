require 'rails/all'
require 'rails/generators'
require 'jquery-rails'
require 'ransack'
require 'will_paginate'
require 'simple_form'
require 'paperclip'
require 'ckeditor'
require 'twitter-bootstrap-rails'
require 'will_paginate-bootstrap'
require 'rails3-jquery-autocomplete'
require 'state_machine'
require 'deface'

module Taurus
  module Core
    def self.config(&block)
	    yield(Taurus::Config)
	  end
  end
end

require 'taurus/core/version'
require 'taurus/core/engine'
require 'generators/taurus/dummy/dummy_generator'
require 'generators/taurus/sandbox/sandbox_generator'