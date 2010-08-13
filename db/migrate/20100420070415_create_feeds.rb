class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :url, :name
      t.datetime :last_modified
    end
    add_index :feeds, :name
  end
  
  

  def self.down
  end
end
