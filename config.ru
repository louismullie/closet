require 'bundler/setup'
require 'sinatra/base'

require './app'

use Rack::ShowExceptions

run Closet::Application.new