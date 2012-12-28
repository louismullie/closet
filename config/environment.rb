if settings.environment == :development
  require 'better_errors'
  use BetterErrors::Middleware
  BetterErrors.application_root = settings.root
end