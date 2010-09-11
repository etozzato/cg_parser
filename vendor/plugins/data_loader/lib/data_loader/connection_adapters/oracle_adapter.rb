module DataLoader
  module ConnectionAdapters
    module OracleAdapter
      # This loads a PL/SQL package by using the native "execute" feature
      # of Rails migrations. Note that this is Oracle-specific and must be
      # reimplemented for other adapters.
      def load_package(pkg_name)
        sql_text = read_db_file("db/packages/#{pkg_name}.pkg")
        sql_text.sub(/\s*\/\s*\Z/,'').split(/^\s*\/\s*$/m).each do |sql|
          execute sql.gsub(/[\r]+/,'')
        end 
      end

      def drop_package(pkg_name)
        begin
          execute "DROP PACKAGE #{pkg_name}"
        rescue Exception => e
          raise unless e.to_s =~ /\bORA-04043\b/
        end
      end

      def load_trigger(trig_name)
        sql_text = read_db_file("db/triggers/#{trig_name}_trigger.sql")
        sql_text.sub(/\s*\/\s*\Z/,'').split(/^\s*\/\s*$/m).each do |sql|
          execute sql.gsub(/[\r]+/,'')
        end
      end

      def drop_trigger(trig_name)
        begin
          execute "DROP TRIGGER #{trig_name}"
        rescue Exception => e
          raise unless e.to_s =~ /\bORA-04043\b/
        end
      end

      def load_view(view_name)
        sql_text = read_db_file("db/views/#{view_name}.sql")
        execute sql_text.sub(/\s*\/\s*\Z/,'').sub(/\s*;\s*\Z/,'').gsub(/[\r]+/,'')  # strip "/"
      end

      def drop_view(view_name)
        begin
          execute "DROP VIEW #{view_name}"
        rescue Exception => e
          raise unless e.to_s =~ /\bORA-00942\b/
        end
      end
    end # OracleAdapter
  end
end

