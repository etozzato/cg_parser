require 'config/environment.rb'

task :gem_path do
  puts 'this is gem_path: ' + ENV['GEM_PATH']
  puts `ruby -v`
  puts `which ruby`
  puts `echo $PATH`
  puts `echo $SHELL`
  puts `gem env`
  puts `gem list`
end

task :register_feeds_to_db do
  file = open("#{RAILS_ROOT}/lib/cities.rb").readlines
  file.each do |line|
    state, url, city = line.split(',')
    Feed.add({:state => state.strip, :name => city.strip, :url => url.strip})
  end
end

task :register_feeds_to_oml do
  file = open("#{RAILS_ROOT}/lib/cities.rb").readlines
  file.each do |line|
    state, url, city = line.split(',')
    text = "<outline\n\ttext=\"#{city.strip}\"\n\ttitle=\"#{city.strip}\"\n\ttype=\"rss\"\n\txmlUrl=\"http://#{url.strip}.craigslist.org/cto/index.rss\" htmlUrl=\"http://#{url.strip}.craigslist.org/cto/\"/>"
    puts text
  end
end

# desc 'register_feeds'
# task :register_feeds do
#   Settings::APPLICATIONS.each do |app|
#     Feed.set_table_name(app.gsub(/\W/,'') + '_feeds'.to_sym)
#     markets = Settings::MARKETS.keys
#     markets.each do |m|
#       puts "#{m} -> #{app}"
#       Feed.add(m.to_s)
#     end
#   end
# end

task :parse_atom do
  require 'feedzirra'
  parsed_feed = Feedzirra::Feed.fetch_and_parse(Settings::ATOM_URL)
  reg_exps =  Settings::MAKERS.values.collect{|el| Regexp.new(el[:reg_exp], true)}

  last_post = Post.first(:select => 'published', :order => 'published DESC')
  parsed_feed.entries.each do |entry|
    if entry.published.is_a?(String)
      entry.published =~ /(\d{4})-(\d{2})-(\d{2})T(\d+):(\d+):(\d+).*/
      published = Time.utc($1,$2,$3,$4,$5,$6)
    else
      published = entry.published
    end
      
    if last_post.nil? || last_post.published < published
      Settings::MAKERS.keys.each_with_index do |maker, idx|
        next unless entry
        if entry.title =~ reg_exps[idx]
          Post.add_entry(entry, maker.to_s)
          entry = nil
        end
      end
    end
  end
end

desc 'parse_rss'
task :parse_rss do
  require 'feedzirra'
  feed_list = Feed.find(:all, :limit => 42, 
                        :order => 'last_modified ASC, name ASC', 
                        :conditions => ["(last_modified < ? OR last_modified IS NULL)", 15.minutes.ago])
  feed_urls = feed_list.collect {|el| "http://#{el.url}.craigslist.org/cto/index.rss"}
  parsed_feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
  reg_exps =  Settings::MAKERS.values.collect{|el| Regexp.new(el[:reg_exp], true)}
  update_log  = File.join(RAILS_ROOT, 'log', 'update.log')
  
  feed_list.each do |feed| # 42 T=6min
    puts "http://#{feed.url}.craigslist.org/cto/index.rss"
    new_posts = 0
    feed_handler = parsed_feeds["http://#{feed.url}.craigslist.org/cto/index.rss"]
    if feed_handler.nil? || feed_handler.is_a?(Fixnum)
     `echo '[#{Time.now}] Deleting #{feed.name}' >> #{update_log}`
     feed.destroy
     next
    end
   if feed_handler.last_modified.is_a?(String)
      feed_handler.last_modified =~ /(\d{4})-(\d{2})-(\d{2})T(\d+):(\d+):(\d+).*/
      last_modified = Time.utc($1,$2,$3,$4,$5,$6)
    else
      last_modified = feed_handler.last_modified
    end
    
    if feed.last_modified.nil? || feed.last_modified < last_modified
      Feed.update(feed.id, :last_modified => last_modified)
      last_post = feed.posts.first
      feed_handler.entries.each do |entry|
        
        if entry.published.is_a?(String)
          entry.published =~ /(\d{4})-(\d{2})-(\d{2})T(\d+):(\d+):(\d+).*/
          published = Time.utc($1,$2,$3,$4,$5,$6)
        else
          published = entry.published
        end
        
        if last_post.nil? || last_post.published < published
          #puts "current title: #{title=entry.title}"
          Settings::MAKERS.keys.each_with_index do |maker, idx|
            next unless entry
            #puts "trying #{reg_exps[idx]} #{idx}" 
            if entry.title =~ reg_exps[idx]
              #puts "title match! skipping regexp"
              feed.add_entry(entry, maker.to_s)
              entry = nil
              new_posts += 1
            end
          end
          #puts "done with title: #{title}"
          #feed.add_entry(entry, 'unknown') if entry
        end
      end
    end
    `echo '[#{Time.now}] #{new_posts} new posts for #{feed.name}' >> #{update_log}`
  end
end