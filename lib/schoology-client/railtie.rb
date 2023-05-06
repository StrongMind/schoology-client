require "schoology-client"
require "rails"

module SchoologyClient
  class Railtie < Rails::Railtie
    railtie_name :schoology_client

    rake_tasks do
      path = File.expand_path(__dir__)
      Dir.glob("#{path}/../../tasks/**/*.rake").each { |f| load f }
    end
  end
end
