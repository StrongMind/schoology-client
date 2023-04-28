# frozen_string_literal: true

RSpec.describe Client do
  it "has an api key" do
    client = Schoology::Client.new(oauth_token: "1234")
    assert_equal "1234", client.oauth_token
  end

end
