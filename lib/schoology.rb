# frozen_string_literal: true
require "faraday"
require "faraday_middleware"
require_relative "schoology/version"

module Schoology
  autoload :Client, "schoology/client"
  autoload :Resource, "schoology/resource"
  autoload :GroupResource, "schoology/resources/group"
end
