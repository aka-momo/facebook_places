module FacebookPlaces
  class Client
    ## Accessors
    attr_accessor :access_token

    ## Methods
    def initialize(access_token)
      @access_token = access_token
    end

    # Search for place with place id
    def find(place_id, fields: [])
      options = {
        fields: fields.join(','),
        access_token: access_token
      }
      Place.find(place_id, options: options)
    end

    def search(center: '', q: '', distance: '', categories: [], fields: [])
      options = {
        q: q,
        fields: fields.join(','),
        center: center,
        distance: distance,
        categories: categories.join(','),
        access_token: access_token
      }
      Place.search(options)
    end
  end
end
