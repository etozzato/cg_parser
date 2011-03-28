class Feed < ActiveRecord::Base
  has_many :posts, :order => 'published DESC', :foreign_key => 'feed_name', :primary_key => 'name'
  validates_uniqueness_of :url
  
  def add_entry(entry, maker)
    price = entry.title =~ /\$([0-9]+)/ ? $1 : 0
    title = entry.title.sanitize.gsub(/\$([0-9]+)/,'').gsub(/[^a-zA-Z0-9,.?!-() ]/,' ').gsub(/ +/, ' ').strip
    Post.create(
      :feed_name => self.url,
      :maker => maker,
      :title => title,
      :url => Post.short_post_url(entry),
      :published => entry.published,
      :price => price) if price.to_i > 0
  end
  
  def new_entry(maker, opts)
    Post.create(:feed_name => self.url,
                :maker => maker,
                :title => title,
                :url => Post.short_post_url(entry),
                :published => entry.published,
                :price => price)
  end
  
  def google_url(n=100)
    "http://www.google.com/reader/api/0/stream/contents/feed/http%3A%2F%2F#{self.url}.craigslist.org%2Fcto%2Findex.rss?n=#{n}"
  end
  
  def self.add(params)
    unless exists? :name => params[:name]
      create!(:state => params[:state], :url => params[:url], :name => params[:name])
    end
  end

  def self.url_for(cat, el)
    "http://#{el}.craigslist.org/#{cat}/index.rss"
  end
  
  def self.market_from(url)
    url.gsub(/http:\/\/(.+)\.craigslist.org\/.+\/index.rss/, '\1')
  end
  
end