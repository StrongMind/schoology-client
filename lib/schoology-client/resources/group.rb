# frozen_string_literal: true
require 'pry'

module SchoologyClient
  class GroupResource < Resource
    def create(**attributes)
      GroupResource.new post_request("groups", body: attributes).body
    end
  end
end

