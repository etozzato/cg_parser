class Post < ActiveRecord::Base
  belongs_to :feed
  
  def self.short_post_url(entry)
    entry.url.gsub(/\.html/,'').gsub(/http:\/\/.+\.craigslist\.org\//,'')
  end

  def short_url
    url.gsub(/\.html/,'').gsub(/http:\/\/.+\.craigslist\.org\//,'')
  end
    
  def post_url
    "http://#{feed_name}.craigslist.org/#{url}.html"
  end
  
end