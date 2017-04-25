require 'simplecov'
SimpleCov.start

require 'bundler/setup'
require 'webmock/rspec'
require 'vcr_setup'
require 'facebook_places'
require 'access_token.sample'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
