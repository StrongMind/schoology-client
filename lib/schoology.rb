# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require_relative "schoology/version"

module Schoology
  autoload :Client, "schoology/client"
  autoload :Object, "schoology/object"
  autoload :Resource, "schoology/resource"

  # High-level categories of Schoology API calls
  autoload :GroupResource, "schoology/resources/group"

  # Classes used to return a nicer object wrapping the response data
  autoload :Group, "schoology/objects/group"
end
