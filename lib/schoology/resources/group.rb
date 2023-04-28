# frozen_string_literal: true

module Schoology
  class GroupResource < Resource
    def create(**attributes)
      GroupResource.new post_request("groups", body: attributes).body
    end
  end
end

