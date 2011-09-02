#
# This loads data from a CSV file, reconciling with the DB dynamically.
# Designed to work well with both normal and auto_migrations
#
module DataLoader
  module Loader
    # Ruby 1.9 compat for FasterCSV (painful)
    # http://matthewbass.com/2008/01/05/csv-transmogrifies-into-fastercsv-in-ruby-19/
    require 'csv'
    if CSV.const_defined? :Reader
      require 'faster_csv'  # For CSV data files
    else
      FasterCSV = CSV
    end

    def load_constants(table_name, column_name=:id, options={})
      load_csv_file('db/constants', table_name, column_name, options)
    end

    def load_seed_data(table_name, column_name=:id, options={})
      load_csv_file('db/seed_data', table_name, column_name, options)
    end

    def load_test_data(table_name, column_name=:id, options={})
      # Remember non-dev non-prod environments: prvbeta, ote, pubeta, etc
      rails_env = ENV['RAILS_ENV'] || ENV['RACK_ENV'] || 'development'
      if rails_env[0..2] == "dev" or rails_env == "loadtest"
        load_csv_file('db/test_data', table_name, column_name, options)
      else
        puts "   skipping test_data: #{table_name}"
      end
    end

    def load_errors(table_name, column_name=:id, options={})
      raise "Please do not load_errors into the database anymore"
      load_csv_file('db/errors', table_name, column_name, options)
    end

    # See OracleAdapter
    def load_package(pkg_name)
      raise NotImplementedError, "load_package not implemented for #{self.class.name}"
    end
    def drop_package(pkg_name)
      raise NotImplementedError, "drop_package not implemented for #{self.class.name}"
    end
    def load_trigger(trig_name)
      raise NotImplementedError, "load_trigger not implemented for #{self.class.name}"
    end
    def drop_trigger(trig_name)
      raise NotImplementedError, "drop_trigger not implemented for #{self.class.name}"
    end
    def load_view(view_name)
      raise NotImplementedError, "load_view not implemented for #{self.class.name}"
    end
    def drop_view(view_name)
      raise NotImplementedError, "drop_view not implemented for #{self.class.name}"
    end
    def execute_sql(script_name)
      sql_text = read_db_file("db/sql/#{script_name}.sql")
      execute sql_text.sub(/\s*\/\s*\Z/,'')  # strip "/"
    end

  protected
    def find_all(class_name, conditions)
      raise NotImplementedError, "update_record called on abstract class - use a subclass"
    end

    def delete_all(class_name, conditions)
      raise NotImplementedError, "create_record called on abstract class - use a subclass like ActiveRecordLoader"
    end

    def create_record(class_name, attrib, pk_name, pk_value)
      raise NotImplementedError, "create_record called on abstract class - use a subclass like ActiveRecordLoader"
    end

    def update_record(record, attrib)
      raise NotImplementedError, "update_record called on abstract class - use a subclass"
    end
  
    def missing_column(class_name, record, column_name)
      raise "No such column '#{column_name}' in DB table '#{class_name.table_name}' (record = #{record.inspect})"
    end

    # Subclasses can override optionally
    def class_from_table(table_name)
      table_name.to_s.singularize.camelize.constantize
    end
  
    def class_primary_key(class_name)
      class_name.primary_key
    end

    # Retrieve all db files
    def find_db_files(filename, root_too=false)
      Dir.glob(filename)
    end

    # For when you only want one. Raises an exception otherwise.
    def find_db_file(filename)
      files = find_db_files(filename)
      raise "Found multiple files matching #{filename}:\n\t#{files * "\n\t"}" if files.length > 1
      raise "No file found matching #{filename}" if files.empty?
      files.first
    end

    def read_db_file(filename)
      File.read(find_db_file(filename))
    end

    def load_csv_file(path, table_name, column_name=:id, options={})
      return if ENV['TABLE'] && ENV['TABLE'] != table_name.to_s
      column_name = column_name.to_s.downcase
      class_name  = class_from_table(table_name)
      pk_name     = class_primary_key(class_name)  # maybe 'id' or 'code' or ??

      # Optional subfile suffix that becomes a piece of data
      # This handles stuff like "localizations.en-us.csv" = {:language_code => 'en-us'}
      filepat = File.join(path, table_name)
      filepat += '.*' if options[:subkey]
      filepat += '.csv'

      # Append (rather than only use) title-specific data
      root_too = options[:mode] && options[:mode] == :append

      # Find the files that we're going to be using as inputs
      csv_files = find_db_files(filepat, root_too)
      puts "#{csv_files.inspect}" if ENV['DEBUG']

      # Can't do anything nicer than this
      # If you try, test with titles/mlb10/db/seed_data/lobby_channel_type_options.csv
      if options[:delete]
        puts "xx delete from #{table_name}"
        delete_all(class_name)
      end

      # Dump DB and index by whatever column_name is
      # Get all records that are NOT user-created, eg, id < 10000, if "ID" is our CSV index
      schema_rows = {}
      db_rec = column_name.to_s == 'id' ? find_all(class_name, 'id < 10000') : find_all(class_name)
      db_rec.each do |row|
        unless row[column_name]  # eg row[:id] or row[:name]
          missing_column(class_name, row, column_name)
          next
        end
        # If we're subkeying, we have to double-nest since we will have dups by design
        if options[:subkey]
          subkey = row[options[:subkey]].to_s
          schema_rows[subkey] ||= {}
          schema_rows[subkey][row[column_name].to_s] = row
        else
          # MUST .to_s column value we're indexed on, or else Ruby will sometimes make it Int vs String
          schema_rows[row[column_name].to_s] = row
        end
      end

      # Read each CSV into a big hashref
      # Must do one-by-one due to :subkey
      csv_ids = []  # "id" (or whatever the index is) values from CSV
      csv_files.each do |filename|
        csv_rows = FasterCSV.read(filename, :headers => true, :header_converters => :downcase)

        # Find the subkey if we have it (eg, localizations.en.csv)
        subkey = nil
        if options[:subkey]
          if filename =~ /\.([^.]+)\.csv/
            subkey = $1.to_s
          else
            raise ":subkey => #{options[:subkey]} was given, but filename lacks required format: #{table_name}.[#{options[:subkey]}].csv"
          end
        end

        # Figure out what's an insert/update/delete
        #update_rows = csv_rows.select{|row| schema_rows.has_key? row[column_name]}
        #insert_rows = csv_rows.reject{|row| schema_rows.has_key? row[column_name]}

        # And now update/insert which DB rows are missing
        # Update if it exists, or new otherwise
        csv_rows.each do |row|
          rec = 
            # If we're subkeying, we have to double-nest since we will have dups by design
            if subkey
              schema_rows.has_key?(subkey) ? schema_rows[subkey][row[column_name].to_s] : nil
            else
              schema_rows[row[column_name].to_s]
            end
        
          #puts "? #{column_name}=#{row[column_name]}(#{subkey}): #{rec.inspect}"
          csv_ids << row[column_name].to_s
          if rec and !options[:force]
            update_attr = {}
            row.to_hash.each do |col,val|
              # ignore our insert-only columns
              next if options[:no_update] && Array(options[:no_update]).collect{|el| el.to_s}.include?(col)
              db_val  = normalize_value(rec[col].to_s)
              csv_val = normalize_value(val)
              next if csv_val == db_val # unchanged
              #puts "> #{csv_val.inspect} == #{db_val.inspect}" # unchanged
              update_attr[col] = csv_val
            end

            next if update_attr.keys.length == 0  # no changes; skip

            # Handle subkey files (eg, localizations.en-us.csv)
            update_attr[options[:subkey]] = subkey if subkey

            puts "++ load(update) [#{column_name}=#{row[column_name]}]: #{pretty_hash(update_attr)}" if $TRACE
            update_record(class_name, rec, update_attr)
          else
            # Must delete primary key from new attributes as AR doesn't allow Model.new(:id => 1)
            # http://www.killswitchcollective.com/articles/45_legacy_data_migration_with_activerecord
            new_attr = row.to_hash              
            pk_value = new_attr.delete(pk_name)

            next if new_attr.keys.length == 0  # blank line in CSV (programmer error)              
            # normalize csv_vals also gets us ability to load column value from a file using: "file:"
            new_attr.each do |col,val|                
              csv_val = normalize_value(val.to_s)               
              new_attr[col] = csv_val
            end

            # Handle subkey files (eg, localizations.en-us.csv)
            new_attr[options[:subkey]] = subkey if subkey

            puts "++ load(insert): #{pretty_hash(new_attr)}" if $TRACE
            create_record(class_name, new_attr, pk_name, pk_value)
          end
        end # csv_rows
      
      end # each file

      # If :delete => true, this means wipe any records where the key was NOT found
      # in our new csv_rows
      # XXX doesn't work with subkey conditions the WHERE just gets too hairy to construct
      # if options[:delete] && !csv_ids.empty?
      #   pretty = csv_ids.sort.uniq.collect{|i| "'#{i}'"}.join(',')
      #   puts "xx delete from #{class_name.table_name} [#{column_name} not in (#{pretty})]"
      #   conditions = ["#{column_name} not in (?)", csv_ids]
      #   # also restrict by ID since we load < 10000
      #   conditions[0] += " and id < 10000" if pk_name.to_s == 'id'
      #   class_name.delete_all(conditions)
      # end
    end # load_csv_file

    # Normalize our value,
    def normalize_value(val)
      if val.nil? or val.empty?
        nil  # NULL
      elsif val.sub!(/^file:/,'')
        File.read(find_db_file(val))
      else
        val
      end
    end
  
    def pretty_hash(hash)
      return hash unless hash
      newh = {}
      hash.each do |k,v|
        newh[k] = v.is_a?(String) ? v[0..100] : v
      end
      newh.inspect
    end

  end # AbstractAdapter
end
