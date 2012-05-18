require 'taurus_core'
require 'devise'
require 'cancan'

module Taurus
  module Auth
  	def self.config(&block)
      yield(Taurus::Auth::Config)
    end
  end
end
require 'taurus/auth/engine'