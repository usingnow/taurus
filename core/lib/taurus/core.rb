require 'rails/all'
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


module Taurus
  module Core
    def self.config(&block)
	    yield(Taurus::Config)
	  end
  end
end
require 'taurus/core/engine'