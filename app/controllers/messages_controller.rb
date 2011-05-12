class MessagesController < ApplicationController
  def index
    @messages = Message.limit(19)
  end

  def create
    @message = Message.create(params[:message])
    @message.user = current_user.name
    @message.save
  end
end
