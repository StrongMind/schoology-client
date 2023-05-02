# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require_relative "schoology-client/version"

module SchoologyClient
  autoload :Client, "schoology-client/client"
  autoload :Object, "schoology-client/object"
  autoload :Resource, "schoology-client/resource"
  autoload :Error, "schoology-client/error"

  # High-level categories of Schoology API calls
  autoload :GroupResource, "schoology-client/resources/group"

  # Classes used to return a nicer object wrapping the response data
  autoload :Group, "schoology/objects/group"
end
