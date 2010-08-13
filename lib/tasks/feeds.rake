require 'config/environment'
require 'feedzirra'

desc 'register_feeds'
task :register_feeds do
  
  markets = Cg::MARKETS.keys
  markets.each do |m|
    puts m.to_s
    Feed.add(m.to_s)
  end
  
end

desc 'update_feeds'
task :update_feeds do
  feed_list = Feed.find(:all, :limit => 30, 
                        :order => 'last_modified ASC, name ASC', 
                        :conditions => ["(last_modified < ? OR last_modified IS NULL)", 15.minutes.ago])
  feed_urls = feed_list.collect {|el| el.url }
  parsed_feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
  
  feed_list.each do |feed|
    feed_handler = parsed_feeds[feed.url]
    if feed.last_modified.nil? || feed.last_modified < feed_handler.last_modified
      Feed.update(feed.id, :last_modified => feed_handler.last_modified)
      last_post = feed.posts.first
      feed_handler.entries.each do |entry|
        if last_post.nil? || last_post.published < entry.published
          puts entry.title
          feed.add_entry(entry) if entry.title =~ /porsche/i
        end
      end
    end

    
  end
  
  
  
end