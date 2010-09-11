#
# This loads data from a CSV file, reconciling with the DB dynamically.
# Designed to work well with both normal and auto_migrations 
#

# Ruby 1.9 compat for FasterCSV (painful)
# http://matthewbass.com/2008/01/05/csv-transmogrifies-into-fastercsv-in-ruby-19/
# require 'csv'
# if CSV.const_defined? :Reader
#   require 'faster_csv'  # For CSV data files
# else
#   FasterCSV = CSV
# end

ActiveRecord::ConnectionAdapters::AbstractAdapter.send(:include, DataLoader::ConnectionAdapters::AbstractAdapter)

# Not my favorite way of doing this, but it works.
if defined?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.send(:include, DataLoader::ConnectionAdapters::PostgresqlAdapter)
end
if defined?(ActiveRecord::ConnectionAdapters::MysqlAdapter)
  ActiveRecord::ConnectionAdapters::MysqlAdapter.send(:include, DataLoader::ConnectionAdapters::MysqlAdapter)
end
if defined?(ActiveRecord::ConnectionAdapters::SQLite3Adapter)
  ActiveRecord::ConnectionAdapters::SQLite3Adapter.send(:include, DataLoader::ConnectionAdapters::Sqlite3Adapter)
end
if defined?(ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter)
  ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.send(:include, DataLoader::ConnectionAdapters::OracleAdapter)
elsif defined?(ActiveRecord::ConnectionAdapters::OracleAdapter)
  ActiveRecord::ConnectionAdapters::OracleAdapter.send(:include, DataLoader::ConnectionAdapters::OracleAdapter)
end
