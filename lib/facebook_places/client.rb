module FacebookPlaces

  class Client
    attr_accessor :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    # Search for place with place id
    def place_by_id(place_id, fields = [])
      options = { access_token: access_token }
      Request.place_by_id_request(place_id, fields: fields, options: options)
    end

  end
end
