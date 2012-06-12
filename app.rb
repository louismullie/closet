# Require dependencies.
require 'bundler'
Bundler.require

module App
  
  require './base'
  
  class Application < Base
    
    configure { require_all 'config', but: 'capistrano'  }
    helpers   { require_all 'helpers' }
    require_all 'routes'
    require_all 'models'
    
  end

end