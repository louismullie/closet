# Require dependencies.
require 'bundler'
Bundler.require

module App
  
  class Application < Sinatra::Base

    # Require configuration.
    configure { require './config.rb' }
    
    # Require all helpers.
    helpers do
      # Require all helpers.
      Dir['./helpers/*.rb'].each do |helper|
        eval File.read(helper)
      end
    end
    
    # Require all routes.
    Dir['./routes/*.rb'].each do |route|
      eval File.read(route)
    end

  end
  
  # Require all models.
  Dir['./models/*.rb'].each do |model|
    require model
  end
  
end