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

      # Set up the OAuth 1.0 consumer
      consumer = OAuth::Consumer.new(
        @oauth_consumer_key,
        @oauth_consumer_secret,
        site: @url,
        scheme: :header,
        signature_method: 'PLAINTEXT',
        realm: 'Schoology API'
      )

      # Set up the Faraday connection
      connection = Faraday.new("#{@url}") do |conn|
        conn.request :url_encoded
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        if @stubs
          conn.adapter adapter, @stubs
        else
          conn.adapter adapter
        end
      end

      return connection
    end

  end
end

