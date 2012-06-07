# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


Taurus::Core::Engine.load_seed if defined?(Taurus::Core)
Taurus::Auth::Engine.load_seed if defined?(Taurus::Auth)
Taurus::Warehouse::Engine.load_seed if defined?(Taurus::Warehouse)
Taurus::Cms::Engine.load_seed if defined?(Taurus::Cms)
