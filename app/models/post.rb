class Post < ActiveRecord::Base
  #belongs_to :feed
  validates_uniqueness_of :url
  validates_presence_of :feed_name

  def self.add_entry(entry, maker)
    price = entry.title =~ /\$([0-9]+)/ ? $1 : 0
    title = entry.title.sanitize.gsub(/\$([0-9]+)/,'').gsub(/[^a-zA-Z0-9,.?!-() ]/,' ').gsub(/ +/, ' ').strip
    Post.create(
      :feed_name => market_from(entry),
      :maker => maker,
      :title => title,
      :url => short_post_url(entry),
      :published => entry.published,
      :price => price) if price.to_i > 0
  end

  def self.short_post_url(entry)
    entry.gsub(/\.html/,'').gsub(/http:\/\/.+\.craigslist\.org\//,'')
  end
  
  def self.market_from(entry)
    entry.url =~ /http:\/\/(.+)\.craigslist.org/ ? $1 : nil
  end

  def short_url
    url.gsub(/\.html/,'').gsub(/http:\/\/.+\.craigslist\.org\//,'')
  end
    
  def post_url
    "http://#{feed_name}.craigslist.org/#{url}.html"
  end
  
end