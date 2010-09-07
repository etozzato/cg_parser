class Feed < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :posts, :order => 'published DESC', :foreign_key => 'feed_name', :primary_key => 'name'
  
  def add_entry(entry)
    Post.create!(
      :feed_name => self.name,
      :title => entry.title.sanitize.gsub(/\$([0-9]+)/,''),
      :url => Post.short_post_url(entry),
      :published => entry.published,
      :price => (entry.title =~ /\$([0-9]+)/ ? $1 : 0))
  end
  
  def self.add(name)
    unless exists? :name => name
      create!(:name => name, :url => url_for(Cg::CAT, name))
    end
  end

  def self.url_for(cat, el)
    "http://#{el}.craigslist.org/#{cat}/index.rss"
  end
  
  def self.market_from(url)
    url.gsub(/http:\/\/(.+)\.craigslist.org\/.+\/index.rss/, '\1')
  end
  
  def self.fetch
    require 'feedzirra'
    feed_list = find(:all, :limit => 60, 
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
        update(feed.id, :last_modified => last_modified)
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
  
end