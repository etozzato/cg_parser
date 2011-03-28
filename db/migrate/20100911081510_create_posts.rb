class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :feed_name, :maker, :title, :url
      t.integer :price, :year
      t.datetime :published
    end
    add_index :posts, :title
    add_index :posts, :feed_name
    add_index :posts, :maker
    add_index :posts, :year
    add_index :posts, :price
  end

  def self.down
  end
end
