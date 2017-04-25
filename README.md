# FacebookPlaces

[![Build Status](https://travis-ci.com/mohameddiaa27/facebook_places.svg?token=z3yXrVS4yVqTxaf5FPz7&branch=master)](https://travis-ci.com/mohameddiaa27/facebook_places)
[![Code Climate](https://codeclimate.com/github/mohameddiaa27/facebook_places/badges/gpa.svg)](https://codeclimate.com/github/mohameddiaa27/facebook_places)
[![Issue Count](https://codeclimate.com/github/mohameddiaa27/facebook_places/badges/issue_count.svg)](https://codeclimate.com/github/mohameddiaa27/facebook_places)
[![Test Coverage](https://codeclimate.com/github/mohameddiaa27/facebook_places/badges/coverage.svg)](https://codeclimate.com/github/mohameddiaa27/facebook_places/coverage)

This gem provides a Ruby wrapper around the [Facebook Places API](https://developers.facebook.com/docs/places/overview).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'facebook_places'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install facebook_places

## Usage

Initializing the Places Client by a token

```ruby
client = FacebookPlaces::Client.new(token)
```

### Places Search [Docs](https://developers.facebook.com/docs/places/web/search)
With the Places Search API, you can search for millions of places worldwide, and retrieve place-related details like the number of checkins, ratings, and addresses—all with a single request. 

```ruby
results = client.search(options)
```

| option     | Description |
|------------|-------------|
| center     | The coordinates for the center of the search, in the format: [latitude],[longitude]; e.g., "140.7307,-73.9918".|
| fields     | An array of [Place fields](https://developers.facebook.com/docs/places/fields) |
| distance   | The maximum distance from the center, in meters. This parameter can only be used in conjunction with center. |
| categories | The place categories to restrict the search results, e.g., ["FOOD_BEVERAGE"].|

**Pagination**
You can paginate through next pages of the search results by 

```ruby
new_results = results.next_page
```

### Place Information [Docs](https://developers.facebook.com/docs/places/web/place-information)
The Places Information API allows your app to retrieve Place-related information. You can retrieve Place-related information using a place ID.

```ruby
place = client.find(place_id, fields: [])
```
| params     | Description |
|------------|-------------|
| place_id   | PLACE_ID    |
| fields     | An array of [Place fields](https://developers.facebook.com/docs/places/fields) |


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mohameddiaa27/facebook_places. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

