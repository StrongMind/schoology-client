# frozen_string_literal: true

require_relative "lib/schoology_client/version"

Gem::Specification.new do |spec|
  spec.name = "strongmind-schoology-client"
  spec.version = SchoologyClient::VERSION
  spec.authors = ["Strongmind"]
  spec.email = ["qwertytalk@strongmind.com"]

  spec.summary = "API wrapper for Schoology LMS API"
  spec.homepage = "https://github.com/Strongmind/schoology-client"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Strongmind/schoology-client"
  spec.metadata["changelog_uri"] = "https://github.com/Strongmind/schoology-client"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "faraday", '>= 2.0'
  spec.add_dependency "simple_oauth", '~> 0.3.1'
  spec.add_dependency "rails", '~> 7.0'
  spec.add_dependency "railties", "~> 7.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
