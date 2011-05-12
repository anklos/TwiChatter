require 'oa-oauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'kJvUC0gG7vjaOJweOwGC8Q', 'b3mOsozVxLXJb4mLBmEQbGk3tfcnmOMIln1ftXTc8U'
end


