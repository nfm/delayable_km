# The main delayable_km class, containing methods for initializing a KISSmetrics API client and making API calls
class KM
  # The default KISSmetrics API endpoint that all requests are sent to
  DEFAULT_API_ENDPOINT = 'http://trk.kissmetrics.com'

  # Create a KISSmetrics API client.
  #
  # @param [String] :api_key Your site's KISSmetrics API key
  def initialize(api_key, options = {})
    @api_key = api_key
    @api_endpoint = DEFAULT_API_ENDPOINT
  end

  # Set the identity of a person using your site
  # @see http://support.kissmetrics.com/apis/common-methods#identify
  #
  # @param [String] :id A unique identifier for a person (email address, user id, or login are common choices)
  def identify(id)
    @id = id
  end

  # Record a KISSmetrics event
  # @see http://support.kissmetrics.com/apis/common-methods#record
  #
  # @param [String] event
  # @param [Hash] params
  # @option options [String] :_p (@id) The identity of the person you are setting properties on. You can also set this by calling #identify.
  def record(event, params = {})
    defaults = { :_n => event, :_p => @id }
    params = defaults.merge(params)
    request('e', params)
  end

  # Associate one KISSmetrics identity with another
  # @see http://support.kissmetrics.com/apis/common-methods#alias
  # @note The order of arguments to this method doesn't actually matter. You can call it with the existing identifier first or second.
  #
  # @param [String] name An existing identifier for a user
  # @param [String] alias_to A new identifier to associate with the user
  def alias(name, alias_to)
    params = { :_n => alias_to, :_p => name }
    request('a', params)
  end

  # Set properties on a person without recording a named event
  # @see http://support.kissmetrics.com/apis/common-methods#set
  #
  # @param [Hash] params An arbitrary hash of properties to associate with a person
  # @option options [String] :_p (@id) The identity of the person you are setting properties on. You can also set this by calling #identify.
  def set(params)
    defaults = { :_p => @id }
    params = defaults.merge(params)
    request('s', params)
  end

private
  def request(path, params)
    params = { :_t => Time.now.utc.to_i.to_s, :_d => 1, :_k => @api_key }.merge(params)
    HTTParty.get("#{@api_endpoint}/#{path}", :query => params)
  end
end
