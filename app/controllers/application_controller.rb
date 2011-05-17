class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user, :online_users, :isAllowedToSee?
  
  
  #get current logged in user
  private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  #get all signed in users
  private
  def online_users
    @online_users = Onlineuser.all
  end
  
  
  #@ filter, help to check whether currently signed in user has permission to see the message
  private
  def isAllowedToSee?(message,usr)
    if !message.content.include?('@')
      return true
    end
    if message.user == usr.nickname
      return true
    end
    name = []
    str = message.content+' '
    while str.include?('@')
      name2 = str[/@[a-zA-z]*[\s]/]
      name2[' '] = ''
      str["@"] = " "  
      name <<name2 
    end
    if name.include?('@'+usr.nickname)
      true
    else
      false
    end
  end  
  
end
