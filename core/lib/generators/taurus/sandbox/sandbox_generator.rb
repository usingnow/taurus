require "rails/generators/rails/app/app_generator"

module Taurus
  class SandboxGenerator < Taurus::DummyGenerator
    desc "Creates blank Rails application, installs Taurus and all sample data"

    def self.source_paths
      paths = self.superclass.source_paths
      paths.unshift File.expand_path('../templates', __FILE__)
      paths.flatten
    end

    def drop_database
      say "dropping database"
      inside dummy_path do
        quietly do
          rake 'db:drop -f sandbox/Rakefile'
        end
      end
    end

    protected
    def dummy_path
      'sandbox'
    end

    def gemfile_path
      '../../../Gemfile'
    end

    def module_name
      'Sandbox'
    end

  end
end
