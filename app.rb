module Closet
  
  require 'sinatra'
  
  class Application < Sinatra::Base
    
    set :environment, :development
    # set :environment, :production
    
    # Require the environment's gem group.
    Bundler.require(settings.environment)
    
    # Helper to eval config options in local scope.
    def self.require_all(dir, opts={})
      Dir["./#{dir}/*.rb"].each do |f|
        next if f.index 'deploy.rb'
        begin
          eval File.read f
        rescue Exception => e
          msg = e.message + " in #{f}."
          raise e.class.new(msg)
        end
      end
    end
    
    # Recursively require config and helpers.
    configure { self.require_all 'config'  }
    helpers   { self.require_all 'helpers' }
    
    # Require all available routes.
    self.require_all 'routes'
    
    # Require all database models.
    Dir["./models/*.rb"].each { |model| require model }
    
  end
  
end