gem_path = File.expand_path('~/.gems')
ENV['GEM_PATH'] =  gem_path + ':/usr/lib/ruby/gems/1.9.1' if gem_path

RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot.rb')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.database_configuration_file = 'settings/database.yml'
end
require 'will_paginate' unless defined?(RAKE_CMD)
require File.join(File.dirname(__FILE__), '../', 'settings/base.rb')