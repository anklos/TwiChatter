class MessagesController < ApplicationController
  def index
    @messages = Message.order("created_at DESC").limit(19).order("created_at ASC")
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.name
    @message.save
  end
end
