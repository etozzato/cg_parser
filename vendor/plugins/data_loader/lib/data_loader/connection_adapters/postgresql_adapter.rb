#
# This loads data from a CSV file, reconciling with the DB dynamically.
# Designed to work well with both normal and auto_migrations 
#
module DataLoader
  module ConnectionAdapters
    module PostgresqlAdapter
      def load_csv_file(path, table_name, column_name=:id, options={})
        puts "WARNING: load_csv_file disabled for EC2 prototype"
        return true
      end
      def load_package(pkg_name)
        puts "WARNING: load_package disabled for EC2 prototype"
        return true
      end
      def drop_package(pkg_name)
        puts "WARNING: drop_package disabled for EC2 prototype"
        return true
      end
      def load_trigger(trig_name)
        puts "WARNING: load_trigger disabled for EC2 prototype"
        return true
      end
      def drop_trigger(trig_name)
        puts "WARNING: drop_trigger disabled for EC2 prototype"
        return true
      end
      def load_view(view_name)
        puts "WARNING: load_view disabled for EC2 prototype"
        return true
      end
      def drop_view(view_name)
        puts "WARNING: drop_view disabled for EC2 prototype"
        return true
      end  
      def add_constraint(*args)
        puts "WARNING: add_constraint a stub for EC2 prototype"
        return true
      end
      def add_index(*args)
        puts "WARNING: add_index a stub for EC2 prototype"
        return true
      end
    end
  end
end

