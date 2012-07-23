# Require bundler.
require 'bundler'
# Require all gems.
Bundler.require

# Require all models.
Dir['./models/*.rb'].each do |m|; require m; end

# Our application namespace.
module App
  
  # Require the base class.
  require './base'

  # Our main Sinatra application.
  class Application < Base
    
    configure { require_all 'config', but: 'capistrano'  }
    before do
      I18n.locale = params[:locale] || I18n.default_locale
      @logged_in = !session[:session_id].nil?
    end
    helpers   { require_all 'helpers' }
    require_all 'routes'
  
  end
  
end