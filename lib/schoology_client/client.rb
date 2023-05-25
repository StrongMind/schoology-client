# frozen_string_literal: true
require 'faraday'


module SchoologyClient
  class Client
    attr_reader :oauth_consumer_key, :oauth_consumer_secret, :url

    def initialize(conn = nil)
      if conn.nil?
        # setup faraday connection using 2-legged oauth 1.0
        @connection = Faraday.new(url: SchoologyClient.configuration.url) do |faraday|
          faraday.request :json
          faraday.request :oauth, {
            consumer_key: SchoologyClient.configuration.oauth_consumer_key,
            consumer_secret: SchoologyClient.configuration.oauth_consumer_secret
          }

          faraday.response :json
        end
      else
        @connection = conn
      end
    end

    def group
      GroupResource.new(self)
    end

    def connection
      @connection
    end

  end
end

