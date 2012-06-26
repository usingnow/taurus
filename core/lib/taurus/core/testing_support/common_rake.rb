unless defined?(Taurus::InstallGenerator)
  require 'generators/taurus/install/install_generator'
end

desc "Generates a dummy app for testing"
namespace :common do
  task :test_app do
    require "#{ENV['LIB_NAME']}"
    
    Taurus::DummyGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--database=#{ENV['DB_NAME']}", "--quiet"]
    Taurus::InstallGenerator.start ["--lib_name=#{ENV['LIB_NAME']}", "--auto-accept", "--migrate=false", "--seed=false", "--sample=false", "--quiet"]

    puts "Setting up dummy database..."
    cmd = "bundle exec rake db:drop db:create db:migrate db:test:prepare"

    if RUBY_PLATFORM =~ /mswin/ #windows
      cmd += " >nul"
    else
      cmd += " >/dev/null"
    end

    system(cmd)
    puts "abc"
  end
end
