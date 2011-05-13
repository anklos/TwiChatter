class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :online_users
  
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  private
  def online_users
    @online_users = Onlineuser.all
  end
  
end
