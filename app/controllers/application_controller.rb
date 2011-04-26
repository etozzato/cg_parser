class ApplicationController < ActionController::Base
  before_filter :set_app_name
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  private
  def set_app_name
    if Rails.env.development?
      @app_name ||= Settings::MAKERS.keys.at(rand(Settings::MAKERS.size)).to_s
      @app_url  ||= 'localhost'
    else
      @app_name ||= request.env['SERVER_NAME'].gsub(/^www\./,'').gsub(/^stage\./,'').gsub(/\.us$/,'').clean
      @app_url  ||= request.env['SERVER_NAME'].gsub(/^www\./,'')
    end
    # @price_filter ||= {}
    # @price_range ||= Post.first(:select => 'MAX(price) AS max, MIN(price) AS min', :conditions => ["maker = ?", @app_name])
    # @price_filter[:abs_min], @price_filter[:abs_max] = @price_range.min, [@price_range.max.to_i, 200000].max
    # @price_filter[:min], @price_filter[:max] = (params[:price_min]||@price_range.min), (params[:price_max]||@price_range.max)
  end

end
