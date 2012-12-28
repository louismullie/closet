# Setup better errors. Absolutely make
# sure you don't run this in production.
if settings.environment == :development
  require 'better_errors'
  use BetterErrors::Middleware
  BetterErrors.application_root = settings.root
end