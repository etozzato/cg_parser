module DataLoader
  module ConnectionAdapters
    module MongoAdapter
      include DataLoader::Loader

      # Important: This is currently coded to the Mongo core API, **NOT** MongoRecord::Base

      def class_from_table(table_name)
        # Return a collection from our base driver
        unless defined?($db)
          raise "Must connect to mongo and store in $db before using data_loader:  $db = Mongo::Connection.new('host', port).db('dbname')"
        end
        $db.collection(table_name)  # use the Mongo collection as the class
      end

      def class_primary_key(class_name)
        nil
      end

      def find_all(class_name, conditions={})
        class_name.find(conditions)
      end

      def delete_all(class_name)
        class_name.remove
      end
    
      # Called if the column is missing, since schemaless stores work fundamentally
      # differently.  Here, we blow away the record entirely.
      def missing_column(class_name, record, column_name)
        puts "Deleting invalid record with missing '#{column_name}' attribute: #{record.inspec}"
        class_name.remove(record)
      end

      def update_record(class_name, record, attrib)
        attrib['updated_at'] = Time.now
        #puts "Updating record: #{attrib.inspect}"
        raise "Internal bug: Missing _id required to update a Mongo record: #{attrib.inspect}" unless record['_id']
      
        # Mongo Ruby driver does full-overwrite (non-merging) saves.  This means we must include
        # the full attrib list to be saved or else we lose the unchanged attributes.
        class_name.save(record.merge(attrib))
      end

      def create_record(class_name, attrib, pk_name=nil, pk_value=nil)
        raise "Cannot override primary key name in MongoDB - must be _id" if pk_name && pk_name.to_s != '_id'
        attrib['_id'] = pk_value if pk_value
        attrib['created_at'] = Time.now
        attrib['updated_at'] = Time.now
        #puts "Creating record: #{attrib.inspect}"
        class_name.save(attrib)
      end
    end
  end
end