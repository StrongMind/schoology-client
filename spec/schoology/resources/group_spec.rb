# frozen_string_literal: true

require "json"
RSpec.describe Schoology::GroupResource do
  it "exists" do
    expect(Schoology::GroupResource).to be_a(Class)
  end

  it "creates a group" do
    body = {
      "title": "Test Group",
      "description": "This is a test group."
    }

    stub = stub_request("groups", method: :post, body: body,
                                  response: stub_response(fixture: "groups/create", status: 201))
    client = Schoology::Client.new(oauth_token: "fake", adapter: :test, stubs: stub)
    group = client.group.create(**body)

    # assert group was created
    expect(group).to be_a(Schoology::GroupResource)
    expect(group.client['id']).to eq("5604275")
  end
end
