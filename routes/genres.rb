require_relative 'base.rb'

module Routes 
  class Genres < Base
    get '/' do
      'Welcome to spotify'
    end

    prefix 'api'
    version 'v1', using: :path
    
    resource :genres do
      desc "List of all Genres"
      get do 
        # Get all availabe genres off from Spotify
        {genres: %w(R&B Soul)}
      end
    end
  end
end
