# By placing all of Spree's shared dependencies in this file and then loading 
# it for each component's Gemfile, we can be sure that we're only testing just
# the one component of Spree.
source 'http://ruby.taobao.org'
#source 'http://rubygems.org'

gem 'mysql2', '~>0.3.10'
gem 'rake','0.9.2.2'

# Windows下不用安装以下两包。
gem 'execjs'
gem 'therubyracer'


group :assets do
  gem 'sass-rails',   '~> 3.2'
  gem 'coffee-rails', '~> 3.2'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  # turn off assets pipeline log
  gem 'quiet_assets'
end


group :test do
	gem "rspec"
  gem "rspec-rails"
  
	gem 'guard'
  gem 'guard-rspec', '~> 0.5.0'
  gem 'rb-inotify', '0.8.8'
  gem 'libnotify', '0.5.9'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '~> 0.9.0.rc'
	
  gem 'factory_girl_rails','1.4.0' 
  gem 'ffaker'
  gem 'shoulda-matchers', '~> 1.0.0'
end

gemspec