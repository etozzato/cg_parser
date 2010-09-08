require 'config/environment.rb'
#require 'feedzirra'

task :gem_path do
  puts 'this is gem_path: ' + ENV['GEM_PATH']
  puts `ruby -v`
  puts `which ruby`
end

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
  feed_list = Feed.find(:all, :limit => 60, 
                        :order => 'last_modified ASC, name ASC', 
                        :conditions => ["(last_modified < ? OR last_modified IS NULL)", 15.minutes.ago])
  feed_urls = feed_list.collect {|el| el.url }
  parsed_feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
  
  reg_exp =  Regexp.new(CONFIG[:reg_exp], true)
  
  feed_list.each do |feed|
    feed_handler = parsed_feeds[feed.url]
    
    if feed_handler.last_modified.is_a?(String)
      feed_handler.last_modified =~ /(\d{4})-(\d{2})-(\d{2})T(\d+):(\d+):(\d+)\W{1}(\d+)/
      last_modified = Time.utc($1,$2,$3,$4,$5,$6)
    else
      last_modified = feed_handler.last_modified
    end

    if feed.last_modified.nil? || feed.last_modified < last_modified
      Feed.update(feed.id, :last_modified => last_modified)
      last_post = feed.posts.first
      feed_handler.entries.each do |entry|
        
        if entry.published.is_a?(String)
          entry.published =~ /(\d{4})-(\d{2})-(\d{2})T(\d+):(\d+):(\d+)\W{1}(\d+)/
          published = Time.utc($1,$2,$3,$4,$5,$6)
        else
          published = entry.published
        end
        
        if last_post.nil? || last_post.published < published
          if entry.title =~ reg_exp
            puts entry.title
            feed.add_entry(entry) 
          end
        end
      end
    end
  end
end