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