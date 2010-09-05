RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION
ENV['GEM_PATH'] = '/home/etozzato/.gems:/usr/lib/ruby/gems/1.9.1' if Rails.env != 'development'

require File.join(File.dirname(__FILE__), 'boot.rb')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.database_configuration_file = 'settings/database.yml'
end
require "will_paginate"
require 'settings/base.rb'