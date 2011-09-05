class ApplicationController < ActionController::Base
  before_filter :set_app_name
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  private
  def set_app_name
    match = /(?<appname>\w+)(?<appbase>.+)/.match(request.env['SERVER_NAME'])
    @app_name = match[:appname]
    @app_url = request.env['SERVER_NAME']
    @app_base = match[:appbase]
  end

end
