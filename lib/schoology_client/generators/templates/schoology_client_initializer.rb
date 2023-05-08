# frozen_string_literal: true

SchoologyClient.configure do |config|

  # Schoology OAuth consumer key and secret can be found at https://app.schoology.com/api
  config.oauth_consumer_key = ENV['SCHOOLOGY_OAUTH_CONSUMER_KEY']
  config.oauth_consumer_secret = ENV['SCHOOLOGY_OAUTH_CONSUMER_SECRET']

  # This is the base URL for the Schoology API. It should be set to
  # to something like 'https://api.schoology.com/v1'
  config.url = ENV['SCHOOLOGY_API_URL']

end
