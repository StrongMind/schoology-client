# frozen_string_literal: true
require 'json'

module SchoologyClient
  class GroupResource < Resource
    def create(**attributes)
      GroupResource.new post_request("groups", body: attributes.to_json).body
    end
  end
end

