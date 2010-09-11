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

ActiveRecord::Schema.define(:version => 20100911082234) do

  create_table "alfaromeo_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "alfaromeo_feeds", ["name"], :name => "index_alfaromeo_feeds_on_name"

  create_table "alfaromeo_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "alfaromeo_posts", ["feed_name"], :name => "index_alfaromeo_posts_on_feed_name"
  add_index "alfaromeo_posts", ["title"], :name => "index_alfaromeo_posts_on_title"

  create_table "feeds", :force => true do |t|
    t.string   "state"
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "feeds", ["name"], :name => "index_feeds_on_name"
  add_index "feeds", ["url"], :name => "index_feeds_on_url"

  create_table "myacura_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myacura_feeds", ["name"], :name => "index_myacura_feeds_on_name"

  create_table "myacura_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myacura_posts", ["feed_name"], :name => "index_myacura_posts_on_feed_name"
  add_index "myacura_posts", ["title"], :name => "index_myacura_posts_on_title"

  create_table "myaudi_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myaudi_feeds", ["name"], :name => "index_myaudi_feeds_on_name"

  create_table "myaudi_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myaudi_posts", ["feed_name"], :name => "index_myaudi_posts_on_feed_name"
  add_index "myaudi_posts", ["title"], :name => "index_myaudi_posts_on_title"

  create_table "mybmw_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mybmw_feeds", ["name"], :name => "index_mybmw_feeds_on_name"

  create_table "mybmw_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mybmw_posts", ["feed_name"], :name => "index_mybmw_posts_on_feed_name"
  add_index "mybmw_posts", ["title"], :name => "index_mybmw_posts_on_title"

  create_table "mycadillac_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mycadillac_feeds", ["name"], :name => "index_mycadillac_feeds_on_name"

  create_table "mycadillac_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mycadillac_posts", ["feed_name"], :name => "index_mycadillac_posts_on_feed_name"
  add_index "mycadillac_posts", ["title"], :name => "index_mycadillac_posts_on_title"

  create_table "mychevrolet_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mychevrolet_feeds", ["name"], :name => "index_mychevrolet_feeds_on_name"

  create_table "mychevrolet_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mychevrolet_posts", ["feed_name"], :name => "index_mychevrolet_posts_on_feed_name"
  add_index "mychevrolet_posts", ["title"], :name => "index_mychevrolet_posts_on_title"

  create_table "mychrysler_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mychrysler_feeds", ["name"], :name => "index_mychrysler_feeds_on_name"

  create_table "mychrysler_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mychrysler_posts", ["feed_name"], :name => "index_mychrysler_posts_on_feed_name"
  add_index "mychrysler_posts", ["title"], :name => "index_mychrysler_posts_on_title"

  create_table "mydodge_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mydodge_feeds", ["name"], :name => "index_mydodge_feeds_on_name"

  create_table "mydodge_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mydodge_posts", ["feed_name"], :name => "index_mydodge_posts_on_feed_name"
  add_index "mydodge_posts", ["title"], :name => "index_mydodge_posts_on_title"

  create_table "myferrari_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myferrari_feeds", ["name"], :name => "index_myferrari_feeds_on_name"

  create_table "myferrari_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myferrari_posts", ["feed_name"], :name => "index_myferrari_posts_on_feed_name"
  add_index "myferrari_posts", ["title"], :name => "index_myferrari_posts_on_title"

  create_table "myfiat_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myfiat_feeds", ["name"], :name => "index_myfiat_feeds_on_name"

  create_table "myfiat_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myfiat_posts", ["feed_name"], :name => "index_myfiat_posts_on_feed_name"
  add_index "myfiat_posts", ["title"], :name => "index_myfiat_posts_on_title"

  create_table "myford_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myford_feeds", ["name"], :name => "index_myford_feeds_on_name"

  create_table "myford_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myford_posts", ["feed_name"], :name => "index_myford_posts_on_feed_name"
  add_index "myford_posts", ["title"], :name => "index_myford_posts_on_title"

  create_table "mygmc_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mygmc_feeds", ["name"], :name => "index_mygmc_feeds_on_name"

  create_table "mygmc_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mygmc_posts", ["feed_name"], :name => "index_mygmc_posts_on_feed_name"
  add_index "mygmc_posts", ["title"], :name => "index_mygmc_posts_on_title"

  create_table "myhonda_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myhonda_feeds", ["name"], :name => "index_myhonda_feeds_on_name"

  create_table "myhonda_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myhonda_posts", ["feed_name"], :name => "index_myhonda_posts_on_feed_name"
  add_index "myhonda_posts", ["title"], :name => "index_myhonda_posts_on_title"

  create_table "myhummer_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myhummer_feeds", ["name"], :name => "index_myhummer_feeds_on_name"

  create_table "myhummer_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myhummer_posts", ["feed_name"], :name => "index_myhummer_posts_on_feed_name"
  add_index "myhummer_posts", ["title"], :name => "index_myhummer_posts_on_title"

  create_table "myjaguar_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myjaguar_feeds", ["name"], :name => "index_myjaguar_feeds_on_name"

  create_table "myjaguar_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myjaguar_posts", ["feed_name"], :name => "index_myjaguar_posts_on_feed_name"
  add_index "myjaguar_posts", ["title"], :name => "index_myjaguar_posts_on_title"

  create_table "myjeep_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myjeep_feeds", ["name"], :name => "index_myjeep_feeds_on_name"

  create_table "myjeep_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myjeep_posts", ["feed_name"], :name => "index_myjeep_posts_on_feed_name"
  add_index "myjeep_posts", ["title"], :name => "index_myjeep_posts_on_title"

  create_table "mylandrover_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mylandrover_feeds", ["name"], :name => "index_mylandrover_feeds_on_name"

  create_table "mylandrover_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mylandrover_posts", ["feed_name"], :name => "index_mylandrover_posts_on_feed_name"
  add_index "mylandrover_posts", ["title"], :name => "index_mylandrover_posts_on_title"

  create_table "mylexus_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mylexus_feeds", ["name"], :name => "index_mylexus_feeds_on_name"

  create_table "mylexus_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mylexus_posts", ["feed_name"], :name => "index_mylexus_posts_on_feed_name"
  add_index "mylexus_posts", ["title"], :name => "index_mylexus_posts_on_title"

  create_table "mylotus_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mylotus_feeds", ["name"], :name => "index_mylotus_feeds_on_name"

  create_table "mylotus_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mylotus_posts", ["feed_name"], :name => "index_mylotus_posts_on_feed_name"
  add_index "mylotus_posts", ["title"], :name => "index_mylotus_posts_on_title"

  create_table "mymaserati_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mymaserati_feeds", ["name"], :name => "index_mymaserati_feeds_on_name"

  create_table "mymaserati_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mymaserati_posts", ["feed_name"], :name => "index_mymaserati_posts_on_feed_name"
  add_index "mymaserati_posts", ["title"], :name => "index_mymaserati_posts_on_title"

  create_table "mymazda_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mymazda_feeds", ["name"], :name => "index_mymazda_feeds_on_name"

  create_table "mymazda_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mymazda_posts", ["feed_name"], :name => "index_mymazda_posts_on_feed_name"
  add_index "mymazda_posts", ["title"], :name => "index_mymazda_posts_on_title"

  create_table "mymercedesbenz_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mymercedesbenz_feeds", ["name"], :name => "index_mymercedesbenz_feeds_on_name"

  create_table "mymercedesbenz_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mymercedesbenz_posts", ["feed_name"], :name => "index_mymercedesbenz_posts_on_feed_name"
  add_index "mymercedesbenz_posts", ["title"], :name => "index_mymercedesbenz_posts_on_title"

  create_table "mymini_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mymini_feeds", ["name"], :name => "index_mymini_feeds_on_name"

  create_table "mymini_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mymini_posts", ["feed_name"], :name => "index_mymini_posts_on_feed_name"
  add_index "mymini_posts", ["title"], :name => "index_mymini_posts_on_title"

  create_table "mymitsubishi_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mymitsubishi_feeds", ["name"], :name => "index_mymitsubishi_feeds_on_name"

  create_table "mymitsubishi_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mymitsubishi_posts", ["feed_name"], :name => "index_mymitsubishi_posts_on_feed_name"
  add_index "mymitsubishi_posts", ["title"], :name => "index_mymitsubishi_posts_on_title"

  create_table "mynissan_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mynissan_feeds", ["name"], :name => "index_mynissan_feeds_on_name"

  create_table "mynissan_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mynissan_posts", ["feed_name"], :name => "index_mynissan_posts_on_feed_name"
  add_index "mynissan_posts", ["title"], :name => "index_mynissan_posts_on_title"

  create_table "myporsche_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myporsche_feeds", ["name"], :name => "index_myporsche_feeds_on_name"

  create_table "myporsche_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myporsche_posts", ["feed_name"], :name => "index_myporsche_posts_on_feed_name"
  add_index "myporsche_posts", ["title"], :name => "index_myporsche_posts_on_title"

  create_table "myrover_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myrover_feeds", ["name"], :name => "index_myrover_feeds_on_name"

  create_table "myrover_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myrover_posts", ["feed_name"], :name => "index_myrover_posts_on_feed_name"
  add_index "myrover_posts", ["title"], :name => "index_myrover_posts_on_title"

  create_table "mysaab_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mysaab_feeds", ["name"], :name => "index_mysaab_feeds_on_name"

  create_table "mysaab_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mysaab_posts", ["feed_name"], :name => "index_mysaab_posts_on_feed_name"
  add_index "mysaab_posts", ["title"], :name => "index_mysaab_posts_on_title"

  create_table "mysmart_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mysmart_feeds", ["name"], :name => "index_mysmart_feeds_on_name"

  create_table "mysmart_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mysmart_posts", ["feed_name"], :name => "index_mysmart_posts_on_feed_name"
  add_index "mysmart_posts", ["title"], :name => "index_mysmart_posts_on_title"

  create_table "mysubaru_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mysubaru_feeds", ["name"], :name => "index_mysubaru_feeds_on_name"

  create_table "mysubaru_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mysubaru_posts", ["feed_name"], :name => "index_mysubaru_posts_on_feed_name"
  add_index "mysubaru_posts", ["title"], :name => "index_mysubaru_posts_on_title"

  create_table "mytoyota_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "mytoyota_feeds", ["name"], :name => "index_mytoyota_feeds_on_name"

  create_table "mytoyota_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "mytoyota_posts", ["feed_name"], :name => "index_mytoyota_posts_on_feed_name"
  add_index "mytoyota_posts", ["title"], :name => "index_mytoyota_posts_on_title"

  create_table "myvolkswagen_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myvolkswagen_feeds", ["name"], :name => "index_myvolkswagen_feeds_on_name"

  create_table "myvolkswagen_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myvolkswagen_posts", ["feed_name"], :name => "index_myvolkswagen_posts_on_feed_name"
  add_index "myvolkswagen_posts", ["title"], :name => "index_myvolkswagen_posts_on_title"

  create_table "myvolvo_feeds", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.datetime "last_modified"
  end

  add_index "myvolvo_feeds", ["name"], :name => "index_myvolvo_feeds_on_name"

  create_table "myvolvo_posts", :force => true do |t|
    t.string   "feed_name"
    t.string   "title"
    t.string   "url"
    t.integer  "price"
    t.datetime "published"
  end

  add_index "myvolvo_posts", ["feed_name"], :name => "index_myvolvo_posts_on_feed_name"
  add_index "myvolvo_posts", ["title"], :name => "index_myvolvo_posts_on_title"

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
