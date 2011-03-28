# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100911081510) do

  create_table "feeds", :force => true do |t|
    t.string   "state"
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "feeds", ["name"], :name => "index_feeds_on_name"
  add_index "feeds", ["url"], :name => "index_feeds_on_url"

  create_table "posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "maker"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "posts", ["feed_name"], :name => "index_posts_on_feed_name"
  add_index "posts", ["maker"], :name => "index_posts_on_maker"
  add_index "posts", ["title"], :name => "index_posts_on_title"

end
