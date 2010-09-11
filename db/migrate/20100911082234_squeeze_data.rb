class SqueezeData < ActiveRecord::Migration
  def self.up
    Settings::APPLICATIONS.each do |app|
      app_name = app.gsub(/\W/,'')
      Post.set_table_name(app_name + '_posts'.to_sym)
      @posts = Post.all
      Post.set_table_name(:posts)
      @posts.each do |p|
        Post.create(:feed_name => p.feed_name, 
                    :maker => app_name, 
                    :title => p.title, 
                    :url => p.url, 
                    :price => p.price, 
                    :published=> p.published)
        puts "#{app_name} #{p.title}"
      end
    end
  end

  def self.down
  end
end
