class SessionsController < ApplicationController
  def create
      auth = request.env["omniauth.auth"]
      user = User.find_by_provider_and_uid(auth["provider"],auth["uid"]) || User.create_with_omniauth(auth)             
      session["user_id"] = user.id   
      @online_user = Onlineuser.create!(:name => user.name, :nickname=> user.nickname) if !Onlineuser.find_by_name(user.name)
      redirect_to root_url       
  end
  
  def destroy    
    user = User.find_by_id(session["user_id"])
    if user
      online_user = Onlineuser.find_by_name(user.name)  
      Onlineuser.delete(online_user)
    end    
    session["user_id"] = nil
    redirect_to root_url
  end    
end
