# frozen_string_literal: true
require 'schoology_client'
require 'spec_helper'

RSpec.describe SchoologyClient do
  before do
    SchoologyClient.configure do |config|
      config.oauth_consumer_key = "test_key"
      config.oauth_consumer_secret = "test_secret"
      config.url = "https://api.schoology.com/v1"
    end
  end

  context "when initialized" do
    it "has a version number" do
      expect(SchoologyClient::VERSION).not_to be nil
    end

    it "has an oauth_consumer_key" do
      expect(SchoologyClient.configuration.oauth_consumer_key).to eq("test_key")
    end

    it "has an oauth_consumer_secret" do
      expect(SchoologyClient.configuration.oauth_consumer_secret).to eq("test_secret")
    end

    it "has a url" do
      expect(SchoologyClient.configuration.url).to eq("https://api.schoology.com/v1")
    end
  end
end
