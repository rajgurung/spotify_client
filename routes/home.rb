require_relative 'base.rb'

module Routes 
  class Home < Grape::API
    get '/' do
      'Welcome to spotify'
    end
  end
end
