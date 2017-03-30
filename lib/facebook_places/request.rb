module FacebookPlaces

  # Documentaiton
  class Request
    attr_accessor :response

    include ::HTTParty
    format :json

    BASE_SEARCH_URL     = 'https://graph.facebook.com/'.freeze
    VERSION_URL         = 'v2.8/'.freeze
    GET_PLACE_BY_ID_URL = BASE_SEARCH_URL + VERSION_URL
    SEARCH_PLACE_URL    = BASE_SEARCH_URL + VERSION_URL + 'search?type=place'

    def initialize(url, options: {})
      @response = self.class.get(url, query: options)
    end

    # Create Request for getting place with id
    def self.place_by_id_request(place_id, fields: [], options: {})
      url              = place_url(place_id)
      options[:fields] = fields.join(',') unless fields.empty?
      response         = new(url, options: options)
      response.parsed_response
    end

    ## TODO
    def parsed_response
      @response
    end

    private

    def self.place_url(id)
      "#{GET_PLACE_BY_ID_URL}#{id}"
    end

  end
end