class MessagesController < ApplicationController
  def index
    @messages = Message.all.order("created_at DESC").limit(15)
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.name
    @message.save
  end
end
