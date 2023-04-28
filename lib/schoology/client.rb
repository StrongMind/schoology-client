# frozen_string_literal: true

module Schoology
  class Client
    BASE_URL = "https://schoologysandbox.schoology.com/v1"

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
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, oauth_token
        conn.request :json

        conn.response :dates
        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end

