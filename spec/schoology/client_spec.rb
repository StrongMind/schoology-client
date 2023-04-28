# frozen_string_literal: true

RSpec.describe Schoology::Client do
  it "has an api key" do
    client = Schoology::Client.new(oauth_token: "1234")
    expect(client.oauth_token).to eq("1234")
  end

end
