class MessagesController < ApplicationController
  def index
    @messages = Message.limit(0)
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.name
    @message.save
  end
end
