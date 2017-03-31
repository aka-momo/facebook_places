module FacebookPlaces
  class Request
    ## Accessors
    attr_accessor :response, :uri

    ## Methods
    def initialize(url, options: {})
      options.delete_if { |_, value| value.to_s.strip == '' }
      @uri       = URI(url)
      @uri.query = URI.encode_www_form(options)
      @response  = start!
    end

    def parsed_response
      JSON.parse(response.body)
    rescue
      Logger.new(STDOUT).error 'Failed to Parse Response'
    end

    private

    def start!
      http_get do
        return @response if @response.is_a?(Net::HTTPSuccess)
        Logger.new(STDOUT).error parsed_response['error']['message']
        raise StandardError
      end
    end

    def http_get(&block)
      Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
        @request = Net::HTTP::Get.new uri
        @response = http.request @request
        yield
      end
    end
  end
end
