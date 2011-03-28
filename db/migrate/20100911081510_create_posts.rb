class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :feed_name, :maker, :title, :url
      t.integer :price
      t.datetime :published
    end
    add_index :posts, :title
    add_index :posts, :feed_name
    add_index :posts, :maker
  end

  def self.down
  end
end
