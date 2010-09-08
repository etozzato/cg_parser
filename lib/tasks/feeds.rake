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

desc 'register_feeds'
task :register_feeds do
  Settings::APPLICATIONS.each do |app|
    Feed.set_table_name(app.gsub(/\W/,'') + '_feeds'.to_sym)
    markets = Settings::MARKETS.keys
    markets.each do |m|
      puts "#{m} -> #{app}"
      Feed.add(m.to_s)
    end
  end
end

desc 'update_feeds'
task :update_feeds do
  require 'feedzirra'

  update_id   = File.join(RAILS_ROOT, 'log', 'update.id')
  update_log  = File.join(RAILS_ROOT, 'log', 'update.log')
  
  if File.exist?(update_id)
    feed_id = File.read(update_id).to_i
    `echo '#{feed_id+1}' > #{update_id}`
    if feed_id > Settings::APPLICATIONS.size-1
      feed_id = 0
      `echo '#{feed_id+1}' > #{update_id}`
    end else
    feed_id = 0
    `echo '#{feed_id+1}' > #{update_id}` 
  end

  app = Settings::APPLICATIONS[feed_id]
  Feed.set_table_name(app.gsub(/\W/,'') + '_feeds'.to_sym)
  Post.set_table_name(app.gsub(/\W/,'') + '_posts'.to_sym)

  feed_list = Feed.find(:all, :limit => 1, 
                        :order => 'last_modified ASC, name ASC', 
                        :conditions => ["(last_modified < ? OR last_modified IS NULL)", 15.minutes.ago])
  feed_urls = feed_list.collect {|el| el.url }
  parsed_feeds = Feedzirra::Feed.fetch_and_parse(feed_urls)
  
  reg_exp =  Regexp.new(Settings::CONFIG[app.gsub(/\W/,'').to_sym][:reg_exp], true)
  new_posts = 0
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
            new_posts += 1
          end
        end
      end
    end
  end
  `echo '#{new_posts} new posts for #{app}' >> #{update_log}`
end