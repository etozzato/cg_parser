class PostsController < ApplicationController

  def index
    expires_in 10.minutes, :public => true, :private => false
    options = {
        :page => params[:page]||1, 
        :per_page => 100, 
        :order => 'published DESC'
    }
    options.merge!({:conditions => ["title like ?", "%#{params[:q]}%"]}) unless params[:q].blank?
    @posts = Post.paginate(options)
  end

end