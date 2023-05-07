# frozen_string_literal: true
require 'json'

module SchoologyClient
  class GroupResource < Resource
    def create(**attributes)
      response_body = post_request("groups", body: attributes.to_json).body
      return GroupResource.new(response_body)
    end
  end
end

