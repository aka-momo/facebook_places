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
        url          = Configuration::SEARCH_URL
        request      = Request.new(url, options: options)
        response     = RecursiveOpenStruct.new(request.parsed_response)
        add_easy_pagination(response) unless response.dig(:paging, :next).nil?
        response
      end

      private

      def add_easy_pagination(response)
        def response.next_page
          uri = URI(paging.next)
          options = CGI.parse(uri.query)
          FacebookPlaces::Place.search(options)
        end
      end
    end
  end
end
