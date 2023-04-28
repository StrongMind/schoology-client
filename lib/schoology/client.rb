# frozen_string_literal: true

module Schoology
  class Client
    BASE_URL = "https://schoologysandbox.schoology.com/v1"

    attr_reader :oauth_token, :adapter

    def initialize(oauth_token:, adapter: Faraday.default_adapter)
      @oauth_token = oauth_token
      @adapter = adapter
    end
  end
end

