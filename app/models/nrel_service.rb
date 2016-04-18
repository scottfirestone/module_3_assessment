class NrelService
  def initialize
    @_key = ENV["nrel_api_key"]
    @_connection = Faraday.new "https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=1&api_key=#{key}"
  end

  def search(zip)
    response = connection.get do |req|
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
