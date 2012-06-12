require './app'

use Rack::ShowExceptions

run App::Application.new