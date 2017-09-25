require 'faraday'

class Base
  attr_reader :connection

  def initialize
    @base_url  = 'https://accounts.spotify.com'
    @connection = Faraday.new(url: @base_url)
  end 
end
