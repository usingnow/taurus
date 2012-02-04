# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ebiz::Application.initialize!

Date::DATE_FORMATS.merge!(:default => "%Y-%m-%d")
Time::DATE_FORMATS.merge!(:default => "%Y-%m-%d %H:%M:%S")
