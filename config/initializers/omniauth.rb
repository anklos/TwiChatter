require 'oa-oauth'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'OLPVsmmBp4PtKcJTXYFUQ', 'PMUw5LgSWNnyxfU8oCfiXZ5PbKlYCffVqZP6Gmgwg'
end


