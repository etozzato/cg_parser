class MapsController < ApplicationController
  
  def index
    @stats = {}
    feeds = Feed.hash_all('url', :ar_column => 'state')
    posts = Post.all(:select      => 'COUNT(id), feed_name',
                     :conditions  => ["maker = ?", @app_name],
                     :group       => 'feed_name')
    posts.each do |p|
      @stats[feeds[p.feed_name]] ||= 0 
      @stats[feeds[p.feed_name]] += p.attributes['COUNT(id)'].to_i
    end
  end
  
end