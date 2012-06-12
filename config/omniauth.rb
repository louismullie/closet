use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :facebook, 'key', 'secret'
  provider :twitter, 'key', 'secret'
end

use OmniAuth::Strategies::Developer
use OmniAuth::Strategies::Twitter
use OmniAuth::Strategies::Facebook