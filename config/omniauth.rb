use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :facebook, 'key', 'secret'
  provider :twitter, 'key', 'secret'
end