# frozen_string_literal: true

require "json"
require "spec_helper"

RSpec.describe SchoologyClient::GroupResource do

  before do
    SchoologyClient.configure do |config|
      config.oauth_consumer_key = "test_key"
      config.oauth_consumer_secret = "test_secret"
      config.url = "https://api.schoology.com/v1"
    end
  end

  it "exists" do
    expect(SchoologyClient::GroupResource).to be_a(Class)
  end

  it "creates a group" do
    body = {
      "title": "TestGroup"
    }

    stub_response = stub_response(fixture: "groups/create", status: 201)
    stub = stub_request("groups", method: :post, body: body, response: stub_response)
    puts "##########"
    puts stub.inspect
    puts SchoologyClient.configuration.inspect
    puts "##########"
    client = SchoologyClient::Client.new(adapter: :test, stubs: stub)
    group = client.group.create(**body)
    # assert group was created
    expect(group).to be_a(SchoologyClient::GroupResource)
  end
end
