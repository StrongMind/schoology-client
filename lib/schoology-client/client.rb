# frozen_string_literal: true
require 'faraday'
require 'faraday_middleware'
require 'oauth'

module SchoologyClient
  class Client
    BASE_URL = "https://api.schoology.com/v1"

    attr_reader :oauth_token, :adapter

    def initialize(oauth_token:, adapter: Faraday.default_adapter, stubs: nil)
      @oauth_token = oauth_token
      @adapter = adapter
      #used for tests
      @stubs = stubs
    end

    def group
      GroupResource.new(self)
    end

    def connection
      consumer_key = "2c40b07185fbd031567affed01fcff630644fee80"
      consumer_secret = "fd5863739d9f50922aa4f1cb9f4a4908"

      # Set up the OAuth 1.0 consumer
      consumer = OAuth::Consumer.new(
        consumer_key,
        consumer_secret,
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
      end
    end
  end
end

