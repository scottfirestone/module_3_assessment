class NrelService
  def intialize
    @_key = ENV["nrel_api_key"]
  end

  def search
    Faraday.new("https://api.data.gov/nrel/alt-fuel-stations/v1.json?limit=10&api_key=#{key}")
    byebug
  end

  private
    def key
      @_key
    end
end
