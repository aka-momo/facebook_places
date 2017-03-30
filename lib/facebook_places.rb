require "facebook_places/version"
require 'rubygems'
require 'erb'
require 'httparty'

%w(client request).each do |file|
  require File.join(File.dirname(__FILE__), 'facebook_places', file)
end

module FacebookPlaces
  class << self

    def configuration
      yield self
    end

  end
end
