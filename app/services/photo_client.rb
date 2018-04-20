class PhotoClient
  class Collection < Array
    alias_method :total, :length
  end

  def initialize(client = Flickr.new)
    @client = client
    @success = true
  end

  def search(text, params = {})
    return Collection.new if text.blank?

    ensure_connection do
      client.search({
        api_key: api_key,
        text: text
      }.merge(params)) 
    end
  end

  def last_request_success?
    @success
  end

  private

  attr_reader :client

  def api_key
    Rails.application.credentials.dig(:flickr, :api_key)
  end

  def ensure_connection(&block)
    begin
      block.call
    rescue SocketError => e
      @success = false
      Collection.new([])
    end
  end
end
