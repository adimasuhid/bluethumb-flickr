class PhotoClient
  def initialize(client = Flickr.new)
    @client = client
  end

  def search(text, params = {})
    client.search({
      api_key: api_key,
      text: text
    }.merge(params)) 
  end

  private

  attr_reader :client

  def api_key
    Rails.application.credentials.dig(:flickr, :api_key)
  end
end
