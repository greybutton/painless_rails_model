module UserService
  class << self
    def latitude(address)
      results = Geocoder.search(address)
      latitude = results.first&.latitude

      latitude
    end

    def longitude(address)
      results = Geocoder.search(address)
      longitude = results.first&.longitude

      longitude
    end
  end
end
