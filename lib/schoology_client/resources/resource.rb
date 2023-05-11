# frozen_string_literal: true
require 'json'

module SchoologyClient
  class Resource < Resource
    def create(**attributes)
      Resource.new post_request("groups/#{id}/resources", body: attributes.to_json).body
    end
  end
end