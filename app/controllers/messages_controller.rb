class MessagesController < ApplicationController

  #display latest 15 messages after user sign in
  def index
    @messages = Message.order("created_at DESC").limit(15)
  end
  
  #use js to render new message
  def create
    @message = Message.create(params[:message])
    @message.user = current_user.nickname
    @message.save
  end
end
