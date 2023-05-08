# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require 'oauth'

module SchoologyClient
  class Client
    attr_reader :adapter, :oauth_consumer_key, :oauth_consumer_secret, :url, :stubs

    def initialize(adapter: Faraday.default_adapter, stubs: nil)
      @adapter = adapter
      @oauth_consumer_key = SchoologyClient.configuration.oauth_consumer_key
      @oauth_consumer_secret = SchoologyClient.configuration.oauth_consumer_secret
      @url = SchoologyClient.configuration.url

      #used for specs
      @stubs = stubs
    end

    def group
      GroupResource.new(self)
    end

    def connection
      # setup faraday connection using 2-legged oauth 1.0
      connection = Faraday.new(url: @url) do |faraday|
        faraday.request :json
        faraday.request :oauth, {
          consumer_key: @oauth_consumer_key,
          consumer_secret: @oauth_consumer_secret
        }

        faraday.response :json
        faraday.adapter @adapter, @stubs
      end
      return connection
    end

  end
end

