class PostsController < ApplicationController

  def index
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