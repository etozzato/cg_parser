gem_path = File.expand_path('~/.gems')
ENV['GEM_PATH'] =  gem_path + ':/usr/lib/ruby/gems/1.9.1' if gem_path

RAILS_GEM_VERSION = '2.3.9' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot.rb')

# require 'dalli'
# require 'rack/cache'

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  # config.middleware.use Rack::Cache,
  # :verbose     => true,
  # :metastore   => "memcached://127.0.0.1:11211/meta",
  # :entitystore => "memcached://127.0.0.1:11211/body",
  # :allow_reload     => false,
  # :allow_revalidate => false
end

require 'will_paginate'
require 'hash_all'