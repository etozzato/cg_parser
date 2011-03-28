require 'rack-cache'
if Rails.env != 'development'
  host = 'localhost'
  port = 11211
  ActionController::Dispatcher.middleware.use Rack::Cache,
    :verbose     => true,
    :metastore   => "memcached://#{host}:#{port}/",
    :entitystore => "memcached://#{host}:#{port}/",
    :allow_reload     => false,
    :allow_revalidate => false
end