source :rubygems

# *Base framework* #

# Routes
gem 'sinatra'

# Views
gem 'haml'

# Stylesheets
gem 'sass'

# Scripts
gem 'coffee-script'

# Internationalization
gem 'i18n'

# Message passing
gem 'json'

# Markdown & code highlighting
gem 'redcarpet'

# Models
gem 'bson_ext'
gem 'mongoid'
gem 'mongoid_fulltext'

# Authentification
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'omniauth-openid'

# *Group-specific gems* #

# Spec testing
group :test do
  gem 'rspec'
end

# Local testing
group :development do
  gem 'shotgun'
  gem 'thin'
end

# Serving and scaling
group :production do
  gem 'unicorn'
  gem 'foreman'
end

group :deployment do
  gem 'capistrano'
end