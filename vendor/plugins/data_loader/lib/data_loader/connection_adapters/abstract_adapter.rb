module DataLoader
  module ConnectionAdapters
    module AbstractAdapter
      include DataLoader::Loader
      
      def find_all(class_name, conditions={})
        class_name.all(:conditions => conditions)
      end

      def delete_all(class_name)
        class_name.delete_all
      end

      def update_record(class_name, record, attrib)
        attrib[:updated_at] = Time.now if record.respond_to?(:updated_at)
        record.update_attributes!(attrib)
      end
    
      def create_record(class_name, attrib, pk_name=nil, pk_value=nil)
        record = class_name.new(attrib) # get new AR object
        # Use send to call pk attribute setter, eg, admin_account.id= or language.code=
        # These are protected in ActiveRecord so you must send() to them
        record.send("#{pk_name}=", pk_value) if pk_value
        record.created_at = Time.now if record.respond_to?(:created_at)
        record.updated_at = Time.now if record.respond_to?(:updated_at)
        record.save!
      end
    end
  end
end