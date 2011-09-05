class ApplicationController < ActionController::Base
  before_filter :set_app_name
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  rescue_from AppNotFound, :with => :base_app

  private
  def set_app_name
    match = /(\w+)/.match(request.env['SERVER_NAME'])
    raise AppNotFound unless Settings::APPLICATIONS.include? match[0]
    @app_name = match[0]
    @app_url = request.env['SERVER_NAME']
  end
  
  def base_app
    redirect_to Settings::AppBase
  end

end
