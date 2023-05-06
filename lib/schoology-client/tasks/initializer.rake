require "rails"

namespace :schoology-client do
  desc "Generate SchoologyClient initializer file for Rails applications"
  task :install_initializer do
    initializer_path = "config/initializers/schoology_client_initializer.rb"

    if File.exist?(initializer_path)
      puts "An initializer already exists at '#{initializer_path}'. Skipping."
    else
      File.write(initializer_path, <<~INITIALIZER)
        # config/initializers/strongmind_schoology_api.rb

        SchoologyClient.configure |config|
            config.oauth_consumer_key = ENV['SCHOOLOGY_OAUTH_CONSUMER_KEY']
            config.oauth_consumer_secret = ENV['SCHOOLOGY_OAUTH_CONSUMER_SECRET']
            config.url = ENV['SCHOOLOGY_URL']

            :
        end

      INITIALIZER

      puts "Generated initializer at '#{initializer_path}'."
    end
  end
end
