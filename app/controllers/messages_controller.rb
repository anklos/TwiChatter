class MessagesController < ApplicationController
  def index
    @messages = Message.order("created_at DESC").limit(15)
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.nickname
    @message.save
  end
end
