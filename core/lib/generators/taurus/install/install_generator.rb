require 'rails/generators'
require 'bundler'
require 'bundler/cli'

module Taurus
  class InstallGenerator < Rails::Generators::Base
    class_option :migrate, :type => :boolean, :default => true, :banner => 'Run Taurus migrations'
    class_option :seed, :type => :boolean, :default => true, :banner => 'load seed data (migrations must be run)'
    class_option :sample, :type => :boolean, :default => true, :banner => 'load sample data (migrations must be run)'
    class_option :auto_accept, :type => :boolean
    class_option :admin_email, :type => :string
    class_option :admin_password, :type => :string
    class_option :lib_name, :type => :string, :default => 'taurus'

    def self.source_paths
      paths = self.superclass.source_paths
      paths << File.expand_path('../templates', "../../#{__FILE__}")
      paths << File.expand_path('../templates', "../#{__FILE__}")
      paths << File.expand_path('../templates', __FILE__)
      paths.flatten
    end

    def prepare_options
      @run_migrations = options[:migrate]
      @load_seed_data = options[:seed]
      @load_sample_data = options[:sample]

      unless @run_migrations
         @load_seed_data = false
         @load_sample_data = false
      end
    end

    def config_taurus_yml
      create_file "config/taurus.yml" do
        settings = { 'version' => Taurus.version }

        settings.to_yaml
      end
    end

    def remove_unneeded_files
      remove_file "public/index.html"
    end


    def include_seed_data
      append_file "db/seeds.rb", <<-SEEDS
\n
Taurus::Core::Engine.load_seed if defined?(Taurus::Core)
Taurus::Auth::Engine.load_seed if defined?(Taurus::Auth)
Taurus::Warehouse::Engine.load_seed if defined?(Taurus::Warehouse)
Taurus::Cms::Engine.load_seed if defined?(Taurus::Cms)
SEEDS
    end

    def install_migrations
      say_status :copying, "migrations"
      silence_stream(STDOUT) do
        silence_warnings { rake 'railties:install:migrations' }
      end
    end

    def create_database
      say_status :creating, "database"
      silence_stream(STDOUT) do
        silence_stream(STDERR) do
          silence_warnings { rake 'db:create' }
        end
      end
    end

    def run_migrations
      if @run_migrations
        say_status :running, "migrations"
        quietly { rake 'db:migrate' }
      else
        say_status :skipping, "migrations (don't forget to run rake db:migrate)"
      end
    end

    def populate_seed_data
      if @load_seed_data
        say_status :loading,  "seed data"
        rake_options=[]
        rake_options << "AUTO_ACCEPT=1" if options[:auto_accept]
        rake_options << "ADMIN_EMAIL=#{options[:admin_email]}" if options[:admin_email]
        rake_options << "ADMIN_PASSWORD=#{options[:admin_password]}" if options[:admin_password]

        cmd = lambda { rake("db:seed #{rake_options.join(' ')}") }
        if options[:auto_accept] || (options[:admin_email] && options[:admin_password])
          quietly &cmd
        else
          cmd.call
        end
      else
        say_status :skipping, "seed data (you can always run rake db:seed)"
      end
    end

    def load_sample_data
      if @load_sample_data
        say_status :loading, "sample data"
        quietly { rake 'taurus_sample:load' }
      else
        say_status :skipping, "sample data (you can always run rake taurus_sample:load)"
      end
    end

    def complete
      unless options[:quiet]
        puts "*" * 50
        puts "Taurus has been installed successfully. You're all ready to go!"
        puts " "
        puts "Enjoy!"
      end
    end

  end
end
