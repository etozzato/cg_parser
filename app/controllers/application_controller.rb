class ApplicationController < ActionController::Base
  before_filter :set_app_name
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  rescue_from AppNotFound, :with => :base_app

  private
  def set_app_name
    match = /(?<appname>\w+)(?<appbase>.+)/.match(request.env['SERVER_NAME'])
    raise AppNotFound unless Settings::APPLICATIONS.include? match[:appname]
    @app_name = match[:appname]
    @app_url = request.env['SERVER_NAME']
  end
  
  def base_app
    redirect_to Settings::AppBase
  end

end
