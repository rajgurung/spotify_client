require 'grape'
require './routes/home'
require './routes/genres'

class API < Grape::API
  # prefix 'api'
  # version 'v1', using: :path
  format :json

  mount ::Routes::Home => '/'
  mount ::Routes::Genres
end

