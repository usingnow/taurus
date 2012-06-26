# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
<%= module_name %>::Application.initialize!

ActiveRecord::Base.include_root_in_json = true

Date::DATE_FORMATS.merge!(:default => "%Y-%m-%d")
Time::DATE_FORMATS.merge!(:default => "%Y-%m-%d %H:%M:%S")
