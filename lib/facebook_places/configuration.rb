module FacebookPlaces
  # Module including Gem Configuration
  module Configuration
    # BASE URLS
    GRAPH_URL  = 'https://graph.facebook.com/'.freeze
    VERSION    = 'v2.9'.freeze
    BASE_URL   = GRAPH_URL + VERSION + '/'

    # API URLS
    PLACE_URL  = BASE_URL + '%{place_id}'
    SEARCH_URL = BASE_URL + 'search'

    # DEFAULT PARAMS
    SEARCH_DEFAULT_ATTRIBUTES = { type: 'place' }.freeze
  end
end
