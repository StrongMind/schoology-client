# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require 'oauth'

module SchoologyClient
  class Client
    BASE_URL = "https://api.schoology.com/v1"

    attr_reader :adapter, :oauth_consumer_key, :oauth_consumer_secret

    def initialize(adapter: Faraday.default_adapter, stubs: nil)
      @adapter = adapter
      @oauth_consumer_key = SchoologyClient.configuration.oauth_consumer_key
      @oauth_consumer_secret = SchoologyClient.configuration.oauth_consumer_secret

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
        site: BASE_URL,
        scheme: :header,
        signature_method: 'PLAINTEXT',
        realm: 'Schoology API'
      )

      # Set up the Faraday connection
      # Set up the Faraday connection
      connection = Faraday.new(BASE_URL) do |conn|
        conn.request :url_encoded
        conn.response :json
        conn.adapter Faraday.default_adapter
        conn.adapter adapter, @stubs
      end
    end

  end
end

