# frozen_string_literal: true

require "json"
RSpec.describe SchoologyClient::GroupResource do
  it "exists" do
    expect(SchoologyClient::GroupResource).to be_a(Class)
  end

  it "creates a group" do
    body = {
      "title": "Test Group",
      "description": "This is a test group."
    }

    stub = stub_request("groups", method: :post, body: body,
                                  response: stub_response(fixture: "groups/create", status: 201))
    client = SchoologyClient::Client.new(adapter: :test, stubs: stub)
    group = client.group.create(**body)
    # assert group was created
    expect(group).to be_a(SchoologyClient::GroupResource)
  end
end
