class Feed < ActiveRecord::Base
  has_many :posts, :order => 'published DESC', :foreign_key => 'feed_name', :primary_key => 'name'
  validates_uniqueness_of :url
  
  def add_entry(entry, maker)
    price = (entry.title =~ /\$([0-9]+)/ ? $1 : 0)
    Post.create(
      :feed_name => self.url,
      :maker => maker,
      :title => entry.title.sanitize.gsub(/\$([0-9]+)/,''),
      :url => Post.short_post_url(entry),
      :published => entry.published,
      :price => price) if price.to_i > 0
  end
  
  def self.add(name)
    unless exists? :name => name
      create!(:name => name, :url => url_for(Settings::CAT, name))
    end
  end

  def self.url_for(cat, el)
    "http://#{el}.craigslist.org/#{cat}/index.rss"
  end
  
  def self.market_from(url)
    url.gsub(/http:\/\/(.+)\.craigslist.org\/.+\/index.rss/, '\1')
  end
  
end