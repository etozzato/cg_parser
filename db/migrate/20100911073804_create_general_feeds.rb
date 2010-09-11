class CreateGeneralFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :state, :url, :name
      t.datetime :last_modified
    end
    add_index :feeds, :url
    add_index :feeds, :name
    load_seed_data :feeds
  end

  def self.down
    drop_table :feeds
  end
end
