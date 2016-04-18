class NrelService
  def initialize
    @_key = ENV["nrel_api_key"]
    @_connection = Faraday.new "https://api.data.gov/nrel/"
  end

  def search(zip)
    response = connection.get do |req|
      req.url = 
      req.headers['api_key'] = key
      req.params['location'] = zip
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    def key
      @_key
    end

    def connection
      @_connection
    end
end
