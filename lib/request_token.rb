require 'singleton'
require 'faraday'

class RequestToken 
  include Singleton

  attr_reader :connection, :_access_token, :_expires_in  
  private :_access_token, :_expires_in

  def initialize
    super()
    @client_id  = ''
    @secret_key = ''
    @base_url   = ''
    @connection = Faraday.new(url: @base_url)
    _authenticate
  end

  def token
    _authenticate if defined?(_expires_in) && _current_time_greater_than_time_limit
    _access_token
  end  

  private
  
  def _authenticate
    @_acces_token, token_type, @_expires_in = JSON.parse(_post_curl).values
  end

  # Rudimental. Ok for now to carry on to progress with other API calls. 
  def _post_curl
    `curl -X "POST" -H "Authorization: Basic #{_encode}" -d grant_type=client_credentials https://accounts.spotify.com/api/token`
  end

  protected
  
  def _encode
    Base64.encode64("#{@client_id}:#{@secret_key}").gsub(/[=\n]/,'')
  end

  def _current_time_greater_than_time_limit
    Time.now > _time_limit
  end

  def _time_limit
    Time.now + _expires_in.to_i
  end
end
