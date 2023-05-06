# frozen_string_literal: true
require 'schoology-client'
require 'spec_helper'

RSpec.describe SchoologyClient do
  before do
    SchoologyClient.configure do |config|
      config.oauth_consumer_key = "test_key"
      config.oauth_consumer_secret = "test_secret"
      config.url = "https://api.schoology.com/v1"
    end
  end

  it "has a version number" do
    expect(SchoologyClient::VERSION).not_to be nil
  end

  describe "#initialize" do
    let(:client) { SchoologyClient::Client.new }

    it "initializes with the configured API key and secret" do
      expect(client.instance_variable_get(:@oauth_consumer_key)).to eq("test_key")
      expect(client.instance_variable_get(:@oauth_consumer_secret)).to eq("test_secret")
    end
  end
end
