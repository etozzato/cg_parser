class CreatePosts < ActiveRecord::Migration
  def self.up
    Settings::APPLICATIONS.each do |app|
      table_name = app.gsub(/\W/,'') + '_posts'.to_sym
      create_table table_name do |t|
        t.string :feed_name, :title, :url
        t.integer :price
        t.datetime :published
      end
      add_index table_name, :title
      add_index table_name, :feed_name
    end
  end

  def self.down
    Settings::APPLICATIONS.each do |app|
      table_name = app.gsub(/\W/,'') + '_posts'.to_sym
      drop_table table_name
    end
    
  end
end
