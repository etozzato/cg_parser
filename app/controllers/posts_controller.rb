class PostsController < ApplicationController

  def index
    expires_in 10.minutes, :public => true, :private => false

    conditions = ["maker = ?", @app_name]
    
    unless params[:q].blank?
      conditions[0] += " AND LOWER(title) LIKE ?"
      conditions << "%#{params[:q].downcase}%"
    end
    
    unless @price_filter[:min] == @price_filter[:abs_min]
      conditions[0] += " AND price >= ?"
      conditions << @price_filter[:min]
    end
    
    unless @price_filter[:max] == @price_filter[:abs_max]
      conditions[0] += " AND price <= ?"
      conditions << @price_filter[:max]
    end

    options = {
        :page => params[:page]||1, 
        :per_page => 30, 
        :order => 'published DESC',
        :conditions => conditions
    }
    @posts = Post.paginate(options)
  end

end