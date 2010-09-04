class PostsController < ApplicationController

  def index
    expires_in 10.minutes, :public => true, :private => false
    @posts = Post.paginate({:page => params[:page]||1, 
                             :per_page => 100, 
                             :order => 'published DESC'})
  end
  
  def search
    @posts = Post.paginate({:conditions => ["title like ?", "%#{params[:q]}%"], 
                            :page => params[:page]||1, 
                            :per_page => 100, 
                            :order => 'published DESC'})
    render :action => 'index'
  end

end