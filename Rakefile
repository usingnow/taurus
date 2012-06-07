require 'rake'
require 'rubygems/package_task'
require 'thor/group'
require File.expand_path('../core/lib/generators/taurus/install/install_generator', __FILE__)


desc "Creates a sandbox application for simulating the Taurus code in a deployed Rails app"
task :sandbox do
  require 'taurus_core'

  Taurus::SandboxGenerator.start ["--lib_name=taurus"]
  Taurus::InstallGenerator.start ["--auto-accept"]
end