class MessagesController < ApplicationController
  def index
    @messages = Message.limit(5).order("created_at DESC")
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.name
    @message.save
  end
end
