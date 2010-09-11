class DropTables < ActiveRecord::Migration
  def self.up
    Settings::APPLICATIONS.each do |app|
      drop_table app.gsub(/\W/,'') + '_feeds'.to_sym
      drop_table app.gsub(/\W/,'') + '_posts'.to_sym
    end
  end

  def self.down
  end
end
