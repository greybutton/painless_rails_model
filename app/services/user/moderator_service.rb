module User::ModeratorService
  class << self
    def create(params)
      params = update_params(params)
      params.merge(role: :moderator)

      params
    end

    def update(params)
      params = update_params(params)

      params
    end

    private

    def update_params(params)
      params['username'] = downcase(params['username'])
      params['email'] = downcase(params['email'])
      latitude, longitude = coords(params['address'])
      params.merge(latitude: latitude, longitude: longitude)

      params
    end

    def downcase(value)
      value.mb_chars.downcase
    end

    def coords(address)
      results = Geocoder.search(address)
      coords = results.first&.coordinates

      coords
    end
  end
end
