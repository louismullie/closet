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

# Models
gem 'mongo'
gem 'bson_ext'
gem 'mongoid'

# Authentification
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'

# Message passing
gem 'json'

# *Group-specific gems* #

# Spec testing
group :test do
  gem 'rspec'
end

# Testing and deploying
group :development do
  gem 'shotgun'
  gem 'thin'
  gem 'capistrano'
end

# Serving and scaling
group :production do
  gem 'unicorn'
  gem 'foreman'
end