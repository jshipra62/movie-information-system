class ApplicationController < ActionController::Base
  before_action :set_no_cache
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :adminauthorize
  helper_method :userauthorize
 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def userauthorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil? 
  end

  def adminauthorize
    if !current_user.nil? 
      redirect_to login_path, alert: 'You must be logged in as admin to access this page.' if !current_user.admin? 
    else
      redirect_to login_path, alert: 'You must be logged in as admin to access this page.'   
    end
  end

  def set_no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
