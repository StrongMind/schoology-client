# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "rails"
require_relative "schoology_client/version"

module SchoologyClient

  class << self
    attr_accessor :configuration
  end

  autoload :Client, "schoology_client/client"
  autoload :Configuration, "schoology_client/configuration"
  autoload :Object, "schoology_client/object"
  autoload :Resource, "schoology_client/resource"
  autoload :Error, "schoology_client/error"

  # High-level categories of Schoology API calls
  autoload :GroupResource, "schoology_client/resources/group"

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
