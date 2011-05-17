module ApplicationHelper
  
  #broadcast messages to the /message/new channel
  def broadcast(channel, &block)
    message = {:channel => channel,:data => capture(&block)}
    uri = URI.parse("http://vivid-sword-660.heroku.com/bayeux")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
