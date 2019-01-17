require 'singleton'
require 'faraday'

class RequestToken
  include Singleton

  attr_reader :connection, :access_token, :expires_in
  private     :access_token, :expires_in

  def initialize
    super()
    @client_id  = ENV.fetch('CLIENT_ID')
    @secret_key = ENV.fetch('SECRET_KEY')
    @base_url   = ENV.fetch('SPOTIFY_URL')
    @connection = Faraday.new(url: @base_url)
    authenticate
  end

  def token
    authenticate if defined?(expires_in) && current_time_greater_than_time_limit
    access_token
  end

  private

  def authenticate
    @access_token, token_type, @expires_in = JSON.parse(post_curl).values
  end

  # Rudimental. Ok for now to carry on to progress with other API calls.
  def post_curl
    `curl -X "POST" -H "Authorization: Basic #{_encode}" -d grant_type=client_credentials https://accounts.spotify.com/api/token`
  end

  def encode
    Base64.encode64("#{@client_id}:#{@secret_key}").gsub(/[=\n]/,'')
  end

  def current_time_greater_than_time_limit
    Time.now > _time_limit
  end

  def time_limit
    Time.now + _expires_in.to_i
  end
end
