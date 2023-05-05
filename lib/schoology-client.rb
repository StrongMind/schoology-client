# frozen_string_literal: true

require "faraday"
require "faraday_middleware"
require "rails/all"
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

  class Railtie < Rails::Railtie
    initializer 'schoology-client.insert_into_initializer' do
      config_path = Rails.root.join('config/initializers/schoology-client.rb')
      template_path = File.expand_path('../../templates/rails/initializer/schoology-client.rb.tt', __FILE__)
      File.write(config_path, ERB.new(File.read(template_path)).result)
    end
  end
end
