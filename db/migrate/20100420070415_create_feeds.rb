class CreateFeeds < ActiveRecord::Migration
  def self.up
    Settings::APPLICATIONS.each do |app|
      table_name = app.gsub(/\W/,'') + '_feeds'.to_sym
      create_table table_name do |t|
        t.string :url, :name
        t.datetime :last_modified
      end
      add_index table_name, :name
    end
  end

  def self.down
    Settings::APPLICATIONS.each do |app|
      table_name = app.gsub(/\W/,'') + '_feeds'.to_sym
      drop_table table_name
    end
  end
end
