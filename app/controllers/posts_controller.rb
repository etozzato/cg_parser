class PostsController < ApplicationController

  def index
    expires_in 10.minutes, :public => true, :private => false

    conditions = ["maker = ?", @app_name]
    
    unless params[:q].blank?
      conditions[0] += " AND LOWER(title) LIKE ?"
      conditions << "%#{params[:q].downcase}%"
    end

    unless params[:min_price].blank?
      conditions[0] += " AND price >= ?"
      conditions << params[:min_price]
    end
    
    unless params[:max_price].blank?
      conditions[0] += " AND price <= ?"
      conditions << params[:max_price]
    end
    
    unless params[:min_year].blank?
      conditions[0] += " AND year >= ?"
      conditions << params[:min_year]
    end
    
    unless params[:max_year].blank?
      conditions[0] += " AND year <= ?"
      conditions << params[:max_year]
    end
    # unless @price_filter[:min] == @price_filter[:abs_min]
    #   conditions[0] += " AND price >= ?"
    #   conditions << @price_filter[:min]
    # end
    # 
    # unless @price_filter[:max] == @price_filter[:abs_max]
    #   conditions[0] += " AND price <= ?"
    #   conditions << @price_filter[:max]
    # end

    options = {
        :page => params[:page]||1, 
        :per_page => 25, 
        :order => 'published DESC',
        :conditions => conditions
    }
    @posts = Post.paginate(options)
  end

end