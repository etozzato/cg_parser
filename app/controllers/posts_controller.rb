class PostsController < ApplicationController

  def index
    expires_in 10.minutes, :public => true, :private => false

    conditions = ["maker = ?", @app_name]
    
    unless params[:q].blank?
      conditions[0] += " AND LOWER(title) LIKE ?"
      conditions << "%#{params[:q].downcase}%"
    end
    
    options = {
        :page => params[:page]||1, 
        :per_page => 100, 
        :order => 'published DESC',
        :conditions => conditions
    }
    @posts = Post.paginate(options)
  end

end