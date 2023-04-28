# frozen_string_literal: true

module Schoology
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end
  end
end
