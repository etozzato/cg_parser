class ApplicationController < ActionController::Base
  before_filter :set_app_name
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  private
  def set_app_name
    @app_name ||= request.env['SERVER_NAME'].gsub(/^www\./,'').gsub(/^stage\./,'').gsub(/\.us$/,'').clean
    #Post.set_table_name(@app_name + '_posts')
    #Feed.set_table_name(@app_name + '_feeds')
  end

end
