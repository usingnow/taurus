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
  gem 'sass-rails',   '~> 3.1.5'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'rails3-jquery-autocomplete' #自动完成

#pdf打印
gem 'prawn', '0.12.0'


group :test do
  gem "rspec"
  gem "rspec-rails"
  gem 'factory_girl_rails','1.4.0' #测试夹具
  gem 'spork', '~> 0.9.0.rc' #测试加速
end

gemspec


