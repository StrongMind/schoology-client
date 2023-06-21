# frozen_string_literal: true

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
      title: "Test Group",
      description: "This is a test group"
    }

    stub = stub_request("groups", method: :post, body: body, response: stub_response(fixture: "groups/create", status: 201))
    conn = Faraday.new(SchoologyClient.configuration.url) { |b| b.adapter(:test, stub) }
    client = SchoologyClient::Client.new(conn)
    group = client.group.create(**body)

    expect(group).to be_a(SchoologyClient::GroupResource)
    group_result = JSON.parse(group.client)
    expect(group_result['title']).to eq("Test Group")
    expect(group_result['description']).to eq("This is a test group")
  end

  describe 'Update Schoology Group Folder Name' do
    context 'with valid parameters' do
      it 'updates the group name' do
        group_id = 1
        body = {
          title: 'Updated Group',
        }

        stub = stub_request("groups/#{group_id}", method: :put, body: body, response: stub_response(fixture: nil, status: 200))
        conn = Faraday.new(SchoologyClient.configuration.url) { |b| b.adapter(:test, stub) }
        client = SchoologyClient::Client.new(conn)
        group = client.group.update(group_id, **body)

        expect(group).to be_a(SchoologyClient::GroupResource)
      end
    end

    context 'with invalid parameters' do
      it 'raises an error' do
        group_id = 1
        body = {
          title: '',
        }

        error_message = 'Your request was malformed. error'
        stub = stub_request("groups/#{group_id}", method: :put, body: body, response: stub_response(fixture: nil, status: 400, body: { 'error' => error_message }.to_json))
        conn = Faraday.new(SchoologyClient.configuration.url) { |b| b.adapter(:test, stub) }
        client = SchoologyClient::Client.new(conn)

        expect {
          client.group.update(group_id, **body)
        }.to raise_error(SchoologyClient::Error, error_message)
      end
    end
  end

end
