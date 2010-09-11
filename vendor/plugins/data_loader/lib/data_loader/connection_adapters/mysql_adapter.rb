#
# This loads data from a CSV file, reconciling with the DB dynamically.
# Designed to work well with both normal and auto_migrations 
#
module DataLoader
  module ConnectionAdapters
    module MysqlAdapter
      def load_package(pkg_name)
        disabled_for_mysql_port :load_package, pkg_name
      end

      def drop_package(pkg_name)
        disabled_for_mysql_port :drop_package, pkg_name
      end

      def load_trigger(trig_name)
        disabled_for_mysql_port :load_trigger, trig_name
      end

      def drop_trigger(trig_name)
        disabled_for_mysql_port :drop_trigger, trig_name
      end

      def drop_function(func_name)
        execute "DROP FUNCTION IF EXISTS #{func_name}" rescue nil
      end
      
      def drop_procedure(proc_name)
        execute "DROP PROCEDURE IF EXISTS #{proc_name}" rescue nil
      end
      
      def disabled_for_mysql_port(who, what)
        puts "WARNING: #{who}(:#{what}) disabled for mysql"
        true
      end
      
      def load_procedure(proc_name)
        drop_procedure proc_name  # create or replace
        sql_text = read_db_file("db/procedures/#{proc_name}.sql")
        execute  sql_text
      end

      def load_function(func_name)
        drop_function func_name  # create or replace
        sql_text = read_db_file("db/functions/#{func_name}.sql")
        execute  sql_text
      end

      def load_view(view_name)
        sql_text = read_db_file("db/views/#{view_name}.sql")
        #begin
          execute sql_text.sub(/\s*\/\s*\Z/,'').sub(/\s*;\s*\Z/,'').gsub(/[\r]+/,'')  # strip "/"
        #rescue => e
          #puts "WARNING: View #{view_name} had errors: #{e}"
        #end
      end

      def drop_view(view_name)
        execute "drop view #{view_name}" rescue nil
      end
    end
  end
end

