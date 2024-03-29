# frozen_string_literal: true
require 'simplecov'
SimpleCov.start
require "schoology_client"
require 'json'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub_response(fixture: nil, status: 200, headers: { "Content-Type" => "application/json" }, body: "")
  if fixture.nil?
    [status, headers, body]
  else
    [status, headers, File.read("spec/fixtures/#{fixture}.json")]
  end
end

def stub_request(path, response:, method: :get, body: {})
  Faraday::Adapter::Test::Stubs.new do |stub|
    arguments = [method, "/v1/#{path}"]
    arguments << body.to_json if [:post, :put, :patch].include?(method)
    stub.send(*arguments) { |env| response }
  end
end
