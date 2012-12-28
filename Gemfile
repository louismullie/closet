source :rubygems

# Server.
gem 'sinatra'
gem 'sinatra-assetpack'
gem 'unicorn'
gem 'capistrano'
gem 'i18n'

# Database.
gem 'json'
gem 'mongoid'
gem 'mongo'

# Assets.
gem 'haml'
gem 'uglifier'
gem 'sass'
gem 'redcarpet'
gem 'coffee-script'

# Omniauth.
gem 'omniauth'
gem 'openid'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google'
gem 'oa-openid'
gem 'htmltokenizer'
gem 'ruby-hmac'
gem 'omniauth-openid'
gem 'tweetstream'

# Local testing
group :development do
  gem 'shotgun'
  gem 'thin'
end

# For ROFLscaling only
group :production do
  gem 'unicorn'
  gem 'foreman'
end

# For deployment.
group :deployment do
  gem 'capistrano'
end