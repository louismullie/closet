use Rack::Session::Cookie

require 'omniauth'
require 'openid/store/filesystem'
require 'openid/consumer/responses'
require 'omniauth-openid'
require 'omniauth-twitter'
require 'omniauth-facebook'
require 'omniauth-google'

use OmniAuth::Builder do
  provider :twitter, 'Am0ebVxHZY7GIDZ2MecXg', 'bRgssjs9rXHiDwHkSFYknqMsjurlrqTGbHnh1STsw'
  provider :open_id, store: OpenID::Store::Filesystem.new('/tmp')
  provider :facebook, '320120198093309', '5e790cd30b679a8122d4543dd6e33fa0'
  provider :google, '508447679977.apps.googleusercontent.com', 'LBjgWMObS0pzh0ntehw6YyPk'
end