require './app/api.rb'
require './lib/request_token.rb'

use Rack::Config do |env|
  env['token'] = RequestToken.instance.token  
end

run API
