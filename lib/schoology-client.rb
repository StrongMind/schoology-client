# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "rails/all"
require_relative "schoology-client/version"
require_relative "schoology-client/railtie"


module SchoologyClient

  class << self
    attr_accessor :configuration
  end

  autoload :Client, "schoology-client/client"
  autoload :Configuration, "schoology-client/configuration"
  autoload :Object, "schoology-client/object"
  autoload :Resource, "schoology-client/resource"
  autoload :Error, "schoology-client/error"
  autoload :Railtie, "schoology-client/railtie"

  # High-level categories of Schoology API calls
  autoload :GroupResource, "schoology-client/resources/group"

  # Classes used to return a nicer object wrapping the response data
  autoload :Group, "schoology/objects/group"

  def self.configuration
    @configuration ||= SchoologyClient::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def initialize
    @oauth_consumer_key = self.class.configuration.oauth_consumer_key
    @oauth_consumer_secret = self.class.configuration.oauth_consumer_secret
    @url = self.class.configuration.url
  end
end
