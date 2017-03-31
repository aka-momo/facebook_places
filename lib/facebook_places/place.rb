module FacebookPlaces
  class Place
    ## Class Methods
    class << self
      def find(id, options: {})
        url     = Configuration::PLACE_URL % { place_id: id }
        request = Request.new(url, options: options)
        RecursiveOpenStruct.new(request.parsed_response)
      end

      def search(options)
        options.merge! Configuration::SEARCH_DEFAULT_ATTRIBUTES
        url     = Configuration::SEARCH_URL
        request = Request.new(url, options: options)
        request.parsed_response['data'].map { |place| RecursiveOpenStruct.new(place) }
      end
    end
  end
end
