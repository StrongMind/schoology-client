# frozen_string_literal: true

require 'rails/generators/base'

module SchoologyClient
  module Generators

    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Generate Strongmind Schoology Client initializer file for Rails applications"

      def copy_initializer
        template "schoology_api.rb", "config/initializers/schoology_api.rb"
      end
    end
  end
end
