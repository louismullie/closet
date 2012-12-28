require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

Closet::Application.set(:environment, :test)

World do
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers

  Capybara.app = Closet::Application
  # Capybara.app_host = "http://localhost:4567"
end